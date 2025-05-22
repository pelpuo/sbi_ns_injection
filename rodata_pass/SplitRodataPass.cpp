//===-- SplitRodataPass.cpp -- Splits a big rodata array into per-offset globals --===//
//
// This pass finds a global named "rodata_15", inspects all constant-indexed loads
// from it (even through bitcasts), carves out the exact constant values, and folds
// them into new small globals.
//
// Build & load with:
//   mkdir build && cd build
//   cmake .. -DLLVM_DIR=/path/to/llvm/cmake
//   make
//
//   opt \
//     --load-pass-plugin=./SplitRodataPass.so \
//     --passes="split-rodata" \
//     -S input.ll -o output.ll
//
//===----------------------------------------------------------------------===//

#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Operator.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

namespace {
class SplitRodataPass : public PassInfoMixin<SplitRodataPass> {
public:
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &) {
    errs() << "[split-rodata] SplitRodataPass::run() called\n";

    // 1) Grab the global (allow internal/private linkage!)
    GlobalVariable *GV = M.getGlobalVariable("rodata_15", /*AllowInternal=*/true);
    if (!GV || !GV->hasInitializer()) {
      errs() << "[split-rodata] no rodata_15 global\n";
      return PreservedAnalyses::all();
    }

    // 2) Check initializer is an integer array
    Constant *init = GV->getInitializer();
    auto *CDS = dyn_cast<ConstantDataSequential>(init);
    auto *CA  = dyn_cast<ConstantArray>(init);
    if ((!CDS || !CDS->getElementType()->isIntegerTy()) &&
        (!CA  || !CA->getType()->getElementType()->isIntegerTy())) {
      errs() << "[split-rodata] initializer is not an integer array\n";
      return PreservedAnalyses::all();
    }

    DenseMap<uint64_t, SmallVector<LoadInst*,4>> groups;

    // 3) Scan every LoadInst in every function
    for (Function &F : M) {
      for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
          auto *LI = dyn_cast<LoadInst>(&I);
          if (!LI) continue;

          // Strip away bitcasts/addrspacecasts
          Value *ptr = LI->getPointerOperand()->stripPointerCasts();
          auto *GEP = dyn_cast<GEPOperator>(ptr);
          if (!GEP || GEP->getNumIndices() != 2) continue;

          // Expect: getelementptr inbounds (<...> @rodata_15, i32 0, i32 CONST)
          auto *CI = dyn_cast<ConstantInt>(GEP->idx_begin()[1]);
          if (!CI) continue;
          // Confirm base is our global
          if (GEP->getPointerOperand()->stripPointerCasts() != GV) continue;

          uint64_t offset = CI->getZExtValue();
          groups[offset].push_back(LI);
        }
      }
    }

    errs() << "[split-rodata] found " << groups.size() << " unique offsets\n";

    // 4) For each offset, carve out the constant value
    for (auto &KV : groups) {
      uint64_t offset = KV.first;
      auto &loads    = KV.second;
      if (loads.empty()) continue;

      errs() << "[split-rodata] splitting offset " << offset
             << " (" << loads.size() << " loads)\n";

      // Infer type & size from first load
      Type *loadTy = loads[0]->getType();
      if (!loadTy->isIntegerTy()) {
        errs() << "[split-rodata] skipping non-int load\n";
        continue;
      }
      unsigned bitWidth  = loadTy->getIntegerBitWidth();
      unsigned byteWidth = bitWidth / 8;

      // Reconstruct the multi-byte constant (little-endian)
      APInt val(bitWidth, 0);
      for (unsigned i = 0; i < byteWidth; ++i) {
        uint64_t byteVal;
        if (CDS) {
          byteVal = CDS->getElementAsInteger(offset + i);
        } else {
          byteVal = cast<ConstantInt>(CA->getOperand(offset + i))
                        ->getZExtValue();
        }
        APInt part(bitWidth, byteVal);
        val |= part.zextOrTrunc(bitWidth).shl(i * 8);
      }
      Constant *cst = ConstantInt::get(loadTy, val);

      // 5) Create a new private global for this slice
      std::string name = (GV->getName() + "_" + std::to_string(offset)).str();
      auto *newGV = new GlobalVariable(
        M,
        loadTy,
        /*isConstant=*/true,
        GlobalValue::PrivateLinkage,
        cst,
        name
      );

      // 6) Redirect each load to load from newGV
      for (LoadInst *LI : loads) {
        LI->setOperand(0, newGV);
      }
    }

    // 7) If the old array is now unused, remove it
    if (GV->use_empty()) {
      errs() << "[split-rodata] erasing original rodata_15\n";
      GV->eraseFromParent();
    }

    return PreservedAnalyses::none();
  }
};
} // end anonymous namespace

//===----------------------------------------------------------------------===//
// Plugin registration
//===----------------------------------------------------------------------===//
extern "C" PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return {
    LLVM_PLUGIN_API_VERSION,
    "SplitRodataPass",
    LLVM_VERSION_STRING,
    [](PassBuilder &PB) {
      // expose "-passes=split-rodata"
      PB.registerPipelineParsingCallback(
        [](StringRef name,
           ModulePassManager &MPM,
           ArrayRef<PassBuilder::PipelineElement>) {
          if (name == "split-rodata") {
            MPM.addPass(SplitRodataPass());
            return true;
          }
          return false;
        }
      );
      // also insert it at the start of every pipeline
      PB.registerPipelineStartEPCallback(
        [](ModulePassManager &MPM, OptimizationLevel) {
          MPM.addPass(SplitRodataPass());
        }
      );
    }
  };
}
