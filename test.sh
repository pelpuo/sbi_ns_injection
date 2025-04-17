#!/bin/bash

rm -rf ./build
mkdir -p ./build

cd ./build && cmake ../ns_pass && make
cd ..

rm -f test.bc new_test.ll

echo "### Running LLVM pass on test.ll"
echo ""

opt --load-pass-plugin=./build/lib/NsPass.so --passes="ns-reorder" test.ll -o test.bc

echo ""
echo "### Disassembling test.bc to new_test.ll"

llvm-dis test.bc -o new_test.ll
