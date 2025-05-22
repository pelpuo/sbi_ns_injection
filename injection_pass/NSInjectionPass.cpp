// NsPass.cpp

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

namespace {
struct NsPass : PassInfoMixin<NsPass> {
  struct Region {
    GetElementPtrInst *GEP;
    BitCastInst       *BC;
    uint64_t           Off, Len;
    Type              *ElemTy;
  };

  PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
    errs() << "[NsPass] running on function: " << F.getName() << "\n";

    Module &M          = *F.getParent();
    const DataLayout &DL = M.getDataLayout();
    LLVMContext &Ctx   = M.getContext();

    // Find where to insert: right after all allocas/phis in entry block
    BasicBlock &Entry = F.getEntryBlock();
    auto InsertIt = Entry.begin();
    while (isa<PHINode>(InsertIt) || isa<AllocaInst>(InsertIt))
      ++InsertIt;

    // Declaration of protector: i8* zeno_protect(i8*, i64)
    Type *i8Ty          = Type::getInt8Ty(Ctx);
    PointerType *i8PtrTy = PointerType::getUnqual(i8Ty);
    FunctionCallee zenoProtect =
      M.getOrInsertFunction("zeno_protect",
                            i8PtrTy,
                            i8PtrTy,
                            Type::getInt64Ty(Ctx));

    // Scan each alloca<byte[]> for GEP→bitcast regions
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        auto *AI = dyn_cast<AllocaInst>(&I);
        if (!AI) continue;
        if (!AI->getAllocatedType()->isIntegerTy(8) || !AI->isArrayAllocation())
          continue;

        errs() << "  [NsPass] found alloca: " << *AI << "\n";
        SmallVector<Region, 8> Regions;

        // Look for getelementptr i8, i8* %AI, i64 <const>
        for (Use &U : AI->uses()) {
          auto *GEP = dyn_cast<GetElementPtrInst>(U.getUser());
          if (!GEP) continue;
          if (!GEP->hasAllConstantIndices() ||
              GEP->getSourceElementType() != i8Ty)
            continue;
          auto *CI = dyn_cast<ConstantInt>(GEP->getOperand(1));
          if (!CI) continue;
          uint64_t Off = CI->getZExtValue();
          errs() << "    [NsPass] found GEP at offset " << Off
                 << ": " << *GEP << "\n";

          // For each bitcast of that GEP → T*
          for (Use &U2 : GEP->uses()) {
            if (auto *BC = dyn_cast<BitCastInst>(U2.getUser())) {
              PointerType *PT = cast<PointerType>(BC->getType());
              Type *ET = PT->getNonOpaquePointerElementType();
              uint64_t Len = DL.getTypeAllocSize(ET);
              errs() << "      [NsPass] bitcast→" << *PT
                     << ", length=" << Len << "\n";

              Regions.push_back({GEP, BC, Off, Len, ET});
            }
          }
        }

        // Inject one protector call per region
        for (auto &R : Regions) {
          // Reset builder insertion point for each injection
          IRBuilder<> Builder(&*InsertIt);

          // base pointer = &AI[Off]
          Value *Base = Builder.CreateGEP(
            i8Ty,
            AI,
            Builder.getInt64(R.Off),
            "ns_base"
          );

          // call zeno_protect(base, Len)
          Value *Prot = Builder.CreateCall(
            zenoProtect,
            { Base, Builder.getInt64(R.Len) },
            "ns_prot"
          );

          // cast back to original T*
          PointerType *OutPT =
            PointerType::getUnqual(R.ElemTy);
          Value *ProtPtr = Builder.CreateBitCast(
            Prot, OutPT, "ns_ptr"
          );

          // replace old bitcast + clean up
          R.BC->replaceAllUsesWith(ProtPtr);
          R.BC->eraseFromParent();
          if (R.GEP->use_empty())
            R.GEP->eraseFromParent();

          errs() << "    [NsPass] injected protect("
                 << R.Off << "," << R.Len << ")\n";
        }
      }
    }

    return PreservedAnalyses::none();
  }
};
} // end anonymous namespace

// Plugin entry point
extern "C" PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return {
    LLVM_PLUGIN_API_VERSION, "NsPass", "v0.8",
    [](PassBuilder &PB) {
      PB.registerPipelineParsingCallback(
        [](StringRef Name,
           FunctionPassManager &FPM,
           ArrayRef<PassBuilder::PipelineElement>) {
          if (Name == "ns-reorder") {
            FPM.addPass(NsPass());
            return true;
          }
          return false;
        });
    }
  };
}
