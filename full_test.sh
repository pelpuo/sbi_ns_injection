#!/bin/bash

rm -rf ./build
mkdir -p ./build

# Building rodata_pass
cd ./rodata_pass/build 

# && cmake .. && make

cmake .. \
  -DLLVM_DIR=/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/lib/cmake/llvm \
  -DCMAKE_BUILD_TYPE=Release
make

cd ../..

# Building ns_injection pass
cd ./injection_pass 

cmake . \
  -DLLVM_DIR=/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/lib/cmake/llvm \
  -DCMAKE_BUILD_TYPE=Release
make

cd ..

# Building heap_pass
cd ./heap_pass 

cmake . \
  -DLLVM_DIR=/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/lib/cmake/llvm \
  -DCMAKE_BUILD_TYPE=Release
make

cd ..

# deleting old files
rm -f rodata_test.bc rodata_test.ll

echo "### Running LLVM pass on test IR file"
echo ""

# Executing the LLVM pass
/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/bin/opt \
 -opaque-pointers=0 \
  --load-pass-plugin=./rodata_pass/build/SplitRodataPass.so \
  --load-pass-plugin=/home/local/ASUAD/ekayang/Documents/Github/sbi_ns_injection/injection_pass/NSInjectionPass.so \
  --load-pass-plugin=/home/local/ASUAD/ekayang/Documents/Github/sbi_ns_injection/heap_pass/HeapPass.so \
 --passes="split-rodata,function(ns-reorder),function(replace-libcalls)" \
 benchmarks/lifted/df_with_oobw.ll \
 -o full_test.bc

echo ""
echo "### Disassembling full_test.bc to full_test.ll"

/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/bin/llvm-dis full_test.bc -o full_test.ll

echo
echo "Done."