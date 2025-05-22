// NsPass.cpp

#include "llvm/IR/PassManager.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Constants.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

namespace {
struct NsPass : PassInfoMixin<NsPass> {
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
    Module &M  = *F.getParent();
    auto &DL    = M.getDataLayout();
    LLVMContext &Ctx = M.getContext();

    // builder at entry
    IRBuilder<> B(&*F.getEntryBlock().getFirstInsertionPt());

    // declare: i8* zeno_protect(i8*, i64)
    Type *i8Ty       = Type::getInt8Ty(Ctx);
    PointerType *i8PtrTy = PointerType::getUnqual(i8Ty);
    FunctionCallee zenoProtect =
      M.getOrInsertFunction("zeno_protect",
                            i8PtrTy,
                            i8PtrTy,
                            Type::getInt64Ty(Ctx));

    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        // 1) find the single alloca i8, i32 <N>
        auto *AI = dyn_cast<AllocaInst>(&I);
        if (!AI) continue;
        if (!AI->getAllocatedType()->isIntegerTy(8) || !AI->isArrayAllocation())
          continue;

        // 2) collect all the (GEP → bitcast<T*>) uses
        struct Region { GetElementPtrInst *GEP; BitCastInst *BC; uint64_t Off, Len; Type *ElemTy; };
        SmallVector<Region,4> Regions;

        for (Use &U : AI->uses()) {
          auto *GEP = dyn_cast<GetElementPtrInst>(U.getUser());
          if (!GEP) continue;
          // must be: getelementptr i8, i8* %AI, i64 <const>
          if (!GEP->hasAllConstantIndices() ||
              GEP->getSourceElementType() != i8Ty)
            continue;
          auto *CI = dyn_cast<ConstantInt>(GEP->getOperand(2));
          if (!CI) continue;
          uint64_t Off = CI->getZExtValue();

          // each bitcast of that GEP → typed pointer is one “array”
          for (Use &U2 : GEP->uses()) {
            auto *BC = dyn_cast<BitCastInst>(U2.getUser());
            if (!BC) continue;
            // must cast to some T*
            Type *Ty = BC->getType();
            if (!Ty->isPointerTy()) continue;
            // pull out the element type
            auto *PT = cast<PointerType>(Ty);
            Type  *ET = PT->getElementType();
            uint64_t ESize = DL.getTypeAllocSize(ET);
            Regions.push_back({GEP, BC, Off, ESize, ET});
          }
        }

        // 3) at entry, call zeno_protect(base, length) for each region
        for (auto &R : Regions) {
          // base = &AI[ Off ]  i.e. gep on i8*
          Value *Base = B.CreateGEP(
            i8Ty,        // element type of the pointer
            AI,          // the alloca
            B.getInt64(R.Off),
            "ns_base"
          );
          // call zeno_protect(base, Len)
          Value *Prot = B.CreateCall(
            zenoProtect,
            { Base, B.getInt64(R.Len) },
            "ns_prot"
          );
          // cast back to original T*
          PointerType *PTy = PointerType::getUnqual(R.ElemTy);
          Value *ProtPtr = B.CreateBitCast(Prot, PTy, "ns_ptr");

          // replace the old bitcast with our protected pointer
          R.BC->replaceAllUsesWith(ProtPtr);
          R.BC->eraseFromParent();
          if (R.GEP->use_empty())
            R.GEP->eraseFromParent();
        }
      }
    }

    return PreservedAnalyses::none();
  }
};
} // end anon

// plugin entry point
extern "C" PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "NsPass", "v0.3",
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
    }};
}
