### Full compilation pipeline

```bash
llc \
  -march=riscv64 \
  -mattr=+f,+d \
  -filetype=obj \
  df_editing_size.ll \
  -o df_editing_size.o

riscv64-unknown-linux-gnu-gcc \
  -march=rv64imafd \
  -mabi=lp64d \
  -static \
  df_editing_size.o \
  -o df_editing_size

```

```bash
# 1) Lower LLVM IR → RISC-V object with Zeno + F + D
llc \
  -march=riscv64 \
  -mattr=+zeno0p1,+f,+d \
  -filetype=obj \
  df_editing_size.ll \
  -o df_editing_size.o

# 2) Link via the GCC driver, targeting Zeno + LP64D
riscv64-unknown-linux-gnu-gcc \
  -march=rv64imazzeno0p1 \
  -mabi=lp64d \
  -mattr=+f,+d \
  -static \
  df_editing_size.o \
  -o df_editing_size
```