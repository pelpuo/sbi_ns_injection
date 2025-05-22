// convert_ptr_to_typed.cpp
#include "llvm/IR/LLVMContext.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/IR/Module.h"


using namespace llvm;

int main(int argc, char** argv) {
  if (argc != 3) {
    errs() << "Usage: " << argv[0] << " in.ll out.ll\n";
    return 1;
  }

  LLVMContext Ctx;
  // 1) Allow parsing of `ptr`
  Ctx.setOpaquePointers(true);

  SMDiagnostic Err;
  auto M = parseIRFile(argv[1], Err, Ctx);
  if (!M) {
    Err.print(argv[0], errs());
    return 1;
  }

  // 2) Now switch off opaque pointers so printing yields typed pointers
  Ctx.setOpaquePointers(false);

  std::error_code EC;
  raw_fd_ostream Out(argv[2], EC, sys::fs::OF_None);
  if (EC) {
    errs() << "Could not open " << argv[2] << ": " << EC.message() << "\n";
    return 1;
  }

  M->print(Out, nullptr);
  return 0;
}
