#include "llvm/ADT/Statistic.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/Debug.h"

#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

#include "./../include/NsPass.h"

#include "llvm/Support/CommandLine.h"

#include <fstream>
#include <sstream>
#include <vector>
#include <map>

using namespace llvm;

PreservedAnalyses NsPass::run(Function &F, FunctionAnalysisManager &AM) {
    
    llvm::errs() << "Running NsPass on function: " << F.getName() << "\n";
    llvm::errs() << "Function size: " << F.size() << "\n";
    
    if(F.getName() == "main"){
        // Accessing global variables in the module

        auto FirstBB = F.begin();
        IRBuilder<> builder(&(*FirstBB));


        llvm::Type* i8Type = llvm::Type::getInt8Ty(F.getContext());
        PointerType * i8PtrType = PointerType::getUnqual(i8Type);
        // FunctionType *zenoProtectFuncType = FunctionType::get(i8PtrType, {i8PtrType, builder.getInt64Ty()}, true);
        // Function *zenoProtectFunc = Function::Create(zenoProtectFuncType, Function::ExternalLinkage, "zeno_protect", F.getParent());
       
        // Function *printfFunc = F.getParent()->getFunction("printf");
        // if (!printfFunc) {
        //     // printf function doesn't exist, create it
        //     FunctionType *printfFuncType = FunctionType::get(builder.getInt32Ty(), {i8PtrType}, true);
        //     printfFunc = Function::Create(printfFuncType, Function::ExternalLinkage, "printf", F.getParent());
        // }

        FunctionCallee printfFunc = F.getParent()->getOrInsertFunction(
            "printf",
            FunctionType::get(builder.getInt32Ty(), {i8PtrType}, true)
        );

        

        // Insert Namespaces for Global Variables
        Module &M = *F.getParent(); // The parent module of the function

        auto &Ctx = M.getContext();
        auto &DL  = M.getDataLayout();
        Type *i8Ty   = Type::getInt8Ty(Ctx);
        Type *i64Ty  = Type::getInt64Ty(Ctx);
        auto *i8PtrT = PointerType::getUnqual(i8Ty);

        FunctionCallee zenoProtectFunc =
        M.getOrInsertFunction("zeno_protect",
                                FunctionType::get(i8PtrT, {i8PtrT, i64Ty}, false));


        builder.SetInsertPoint(&(*FirstBB->getFirstInsertionPt()));

        for (GlobalVariable &GV : M.globals()) {
            // 1) skip externals & constant‐only globals (string literals, etc.)
            // if (GV.isDeclaration() || GV.isConstant())
            if (GV.isDeclaration() || !GV.getType()->isPointerTy() || GV.isConstant())
                continue;
          
            // 2) bitcast to i8*
            Value *OrigPtr = builder.CreateBitCast(&GV, i8PtrT, "orig.i8");
          
            // 3) call zeno_protect
            uint64_t SizeInBytes = DL.getTypeAllocSize(GV.getValueType());
            CallInst *ci = builder.CreateCall(
                zenoProtectFunc, { OrigPtr, builder.getInt64(SizeInBytes) },
                "prot.i8");
          
            // 4) cast back to the original pointer‐to‐GV type
            Value *protPtr = builder.CreateBitCast(ci, GV.getType(), "prot.ptr");
          
            // 5) only replace uses in real IR instructions
            SmallVector<Use*, 8> ToReplace;
            for (Use &U : GV.uses()) {
              if (Instruction *UserI = dyn_cast<Instruction>(U.getUser())) {
                if (UserI == ci) continue;
                ToReplace.push_back(&U);
              }
            }
            for (Use *UP : ToReplace)
              *UP = protPtr;
          }



        // for (GlobalVariable &GV : M.globals()) {
        //     llvm::errs() << "Global Variable: " << GV.getName() << "\n";
            
        //     // Example: If the global variable is a constant string, print its value

        //     if (GV.getType()->isPointerTy() && GV.getValueType()->isArrayTy() && GV.getValueType()->getArrayElementType()->isIntegerTy(8)) {
        //         Constant *C = dyn_cast<Constant>(GV.getInitializer());
        //         if (C) {
        //             llvm::errs() << "Global Variable Initializer: " << *C << "\n";
        //             Value *newAlloca = builder.CreateAlloca(GV.getValueType(), nullptr, "GLOBAL");
        //             // GV.replaceAllUsesWith(newAlloca);
        //         }
        //     }
        // }

        Value *arrStr = builder.CreateGlobalStringPtr("Executing ZENO_PROTECT on Array %p with size: %d\n");
        Value *strStr = builder.CreateGlobalStringPtr("Executing ZENO_PROTECT on Struct %p with size: %d\n");
        int arrCount = 0;
        int strCount = 0;
        for(auto &BB: F){
            // for(auto &Inst: BB){
            for (auto Inst = BB.begin(), EndInst = BB.end(); Inst != EndInst; ) {
                Instruction &I = *Inst++; 

                if (auto *allocaInst = dyn_cast<AllocaInst>(&I)) {
                    Type *allocatedType = allocaInst->getAllocatedType();
                    intptr_t allocaInstAddress = reinterpret_cast<intptr_t>(allocaInst);

                    if (allocatedType->isArrayTy()) {
                        unsigned arraySize = cast<ArrayType>(allocatedType)->getNumElements();

                        Type *ET  = cast<ArrayType>(allocatedType)->getElementType();
                        uint64_t arrayElemSize = DL.getTypeAllocSize(ET);
                        
                        // unsigned arrayElemSize = cast<ArrayType>(allocatedType)->getArrayElementType()->getPrimitiveSizeInBits()/8;
                        Type * arrayElemType = cast<ArrayType>(allocatedType)->getArrayElementType();

                        builder.SetInsertPoint(&I);
                        Value *newAlloca = builder.CreateAlloca(ArrayType::get(arrayElemType, arraySize), nullptr, "UNPROTECTED_PTR");
                        
                        PointerType* arrayTypePtr = ArrayType::get(arrayElemType, arraySize)->getPointerTo();

                        llvm::Type* i8Type = llvm::Type::getInt8Ty(BB.getContext());
                        PointerType * i8PtrType = PointerType::getUnqual(i8Type);
                        Value* arrayPtr1 = builder.CreateBitCast(newAlloca, PointerType::getUnqual(i8Type));
                        Value* protectedPtr = builder.CreateCall(zenoProtectFunc, {arrayPtr1, builder.getInt64(arraySize * arrayElemSize)});
                        
                        Value* arrayPtr2 = builder.CreateBitCast(protectedPtr, arrayTypePtr);

                        llvm::StringRef allocaName = allocaInst->getName();
                        // arrayPtr2->setName(allocaInst->getName());

                        llvm::outs() << "Array Name: " << allocaName.str() << ", Size: " << arraySize << ", ElemSize: " << arrayElemSize << "\n";

                        allocaInst->replaceAllUsesWith(arrayPtr2);
                        allocaInst->removeFromParent();
                        arrayPtr2->setName(allocaName);

                        // Value *allocaNamePtr = builder.CreateGlobalStringPtr(allocaName);
                        // builder.CreateCall(printfFunc, {arrStr, allocaNamePtr, builder.getInt32(arraySize)});

                    }else if(allocatedType->isStructTy()){
                        // llvm::DataLayout DL = F.getParent()->getDataLayout();
                        StructType *structType = cast<StructType>(allocatedType);
                        unsigned structSize = DL.getTypeAllocSize(structType);

                        builder.SetInsertPoint(&I);
                        Value *newAlloca = builder.CreateAlloca(structType, nullptr, "UNPROTECTED_STRUCT");

                        PointerType* structTypePtr = structType->getPointerTo();

                        llvm::Type* i8Type = llvm::Type::getInt8Ty(BB.getContext());
                        PointerType * i8PtrType = PointerType::getUnqual(i8Type);
                        Value* structPtr1 = builder.CreateBitCast(newAlloca, PointerType::getUnqual(i8Type));
                        Value* protectedPtr = builder.CreateCall(zenoProtectFunc, {structPtr1, builder.getInt64(structSize)});
                        
                        Value* arrayPtr2 = builder.CreateBitCast(protectedPtr, structTypePtr);
                        

                        llvm::StringRef allocaName = allocaInst->getName();
                        allocaInst->replaceAllUsesWith(arrayPtr2);
                        allocaInst->removeFromParent();
                        arrayPtr2->setName(allocaName);

                        // Value *allocaNamePtr = builder.CreateGlobalStringPtr(allocaName);
                        // builder.CreateCall(printfFunc, {strStr, allocaNamePtr, builder.getInt32(structSize)});
                    }
                }
            }
        }

    }
    return PreservedAnalyses::none();
}


// Registering pass
bool PipelineParsingCB(StringRef Name, FunctionPassManager &FPM,
                       ArrayRef<PassBuilder::PipelineElement>) {
  if (Name == "ns-reorder") {
    // llvm::errs() << "Registering NsPass...\n";
    FPM.addPass(NsPass());
    return true;
  }
  return false;
}

void RegisterCB(PassBuilder &PB) {
  PB.registerPipelineParsingCallback(PipelineParsingCB);
}

extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK
llvmGetPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "NsPass", "v0.1", RegisterCB};
}