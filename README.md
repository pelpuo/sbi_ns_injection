### Building 

```
cmake –G Ninja ../countirpass

ninja
```

### Running 
```
opt --load-pass-plugin=lib/CountIR.so --passes="countir" --disable-output --stats demo.ll
```

```
opt --load-pass-plugin=build/lib/CustomReorder.so --passes="reorder-custom"  --inputfile=file.txt demo.ll -o newdemo.bc

```

```
llvm-dis input.bc -o output.ll
```

```
clang input.ll -o output.bin
```


```bash
/convert_ptr_to_typed15 oobr_direct_index_string.ll typed.ll
```

```bash
/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/bin/clang++   -std=c++17   convert_ptr_to_typed.cpp   $(/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/bin/llvm-config \
       --cxxflags --ldflags --system-libs --libs core irreader support)   -o convert_ptr_to_typed15
```

```bash
/home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/bin/opt -opaque-pointers=0 -S oobr_direct_index_string.ll -o test.ll
```