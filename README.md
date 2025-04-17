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
