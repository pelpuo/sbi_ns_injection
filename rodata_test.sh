#!/bin/bash

rm -rf ./build
mkdir -p ./build

cd ./rodata_pass/build 

# && cmake .. && make

cmake .. \
  -DLLVM_DIR=/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/lib/cmake/llvm \
  -DCMAKE_BUILD_TYPE=Release
make

cd ../..

cd ./injection_pass 

cmake . \
  -DLLVM_DIR=/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/lib/cmake/llvm \
  -DCMAKE_BUILD_TYPE=Release
make

cd ..


rm -f rodata_test.bc rodata_test.ll

echo "### Running LLVM pass on test IR file"
echo ""

/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/bin/opt \
 -opaque-pointers=0 \
  --load-pass-plugin=./rodata_pass/build/SplitRodataPass.so \
  --load-pass-plugin=/home/local/ASUAD/ekayang/Documents/Github/sbi_ns_injection/injection_pass/NSInjectionPass.so \
 --passes="split-rodata,function(ns-reorder)" \
 benchmarks/lifted/oobr_direct_index_string.ll \
 -o rodata_test.bc

echo ""
echo "### Disassembling rodata_test.bc to rodata_test.ll"

/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/bin/llvm-dis rodata_test.bc -o rodata_test.ll

echo
echo "Done."