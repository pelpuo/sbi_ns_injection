#!/bin/bash

rm -rf ./build
mkdir -p ./build

cd ./rodata_pass/build && cmake .. && make
cd ../..

rm -f rodata_test.bc rodata_test.ll

echo "### Running LLVM pass on test IR file"
echo ""

opt --load-pass-plugin=./rodata_pass/build/SplitRodataPass.so --passes="split-rodata" benchmarks/lifted/oobr_direct_index_integer.ll -o rodata_test.bc

echo ""
echo "### Disassembling rodata_test.bc to rodata_test.ll"

llvm-dis rodata_test.bc -o rodata_test.ll
