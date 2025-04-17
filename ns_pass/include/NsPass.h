#ifndef NSPASS_H
#define NSPASS_H

#include "llvm/IR/PassManager.h"

class NsPass : public llvm::PassInfoMixin<NsPass> {
public:
  llvm::PreservedAnalyses run(llvm::Function &F,
                              llvm::FunctionAnalysisManager &AM);

};
#endif