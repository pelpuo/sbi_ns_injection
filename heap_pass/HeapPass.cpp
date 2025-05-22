// ReplaceLibCallsPass.cpp

#include "llvm/IR/PassManager.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Constants.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

namespace {
struct ReplaceLibCallsPass : PassInfoMixin<ReplaceLibCallsPass> {
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
    Module *M = F.getParent();
    LLVMContext &Ctx = M->getContext();

    // original → replacement mapping
    StringMap<StringRef> Repl {
      {"malloc", "zeno_malloc"},
      {"free",   "zeno_free"  },
      {"memcpy", "zeno_memcpy"},
      {"strcpy", "zeno_strcpy"}
    };

    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        if (auto *CB = dyn_cast<CallBase>(&I)) {
          // strip any pointer casts
          Value *calleeOp = CB->getCalledOperand()->stripPointerCasts();
          if (auto *origF = dyn_cast<Function>(calleeOp)) {
            auto it = Repl.find(origF->getName());
            if (it == Repl.end()) continue;

            // lookup or insert replacement declaration
            FunctionType *FTy = origF->getFunctionType();
            FunctionCallee newFC =
              M->getOrInsertFunction(it->second, FTy);

            // get the Value* for the new callee
            Value *newCalleeVal = newFC.getCallee();
            // strip casts and cast to Function*
            if (auto *newF = dyn_cast<Function>(newCalleeVal->stripPointerCasts())) {
              CB->setCalledFunction(newF);
            }
          }
        }
      }
    }

    return PreservedAnalyses::none();
  }
};
} // end anonymous namespace

// plugin entry point
extern "C" PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "ReplaceLibCalls", "v0.4",
    [](PassBuilder &PB) {
      PB.registerPipelineParsingCallback(
        [](StringRef Name,
           FunctionPassManager &FPM,
           ArrayRef<PassBuilder::PipelineElement>) {
          if (Name == "replace-libcalls") {
            FPM.addPass(ReplaceLibCallsPass());
            return true;
          }
          return false;
        });
    }};
}
