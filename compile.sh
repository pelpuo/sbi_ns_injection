export LLVM_ROOT=/home/local/ASUAD/ekayang/Documents/LLVM/zeno-llvm/build
export MUSL_ROOT=/opt/riscv_musl
export CC=${LLVM_ROOT}/bin/clang
export LD=${CC}
export CFLAGS=" --target=riscv64-unknown-linux-gnu \
                -march=rv64imazzeno0p1 \
                -menable-experimental-extensions \
                -mabi=lp64 -nostdlib \
                -I${MUSL_ROOT}/include"
export LDFLAGS=" -static -fuse-ld=${LLVM_ROOT}/bin/ld.lld --sysroot=${MUSL_ROOT} -rtlib=compiler-rt"
$CC $CFLAGS -O0 -S -o basic_test_2.s basic_test.ll

# ${LLVM_ROOT}/bin/llvm-objdump --disassemble -S basic_test > basic_test.dump

# export LLVM_ROOT=/home/local/ASUAD/ekayang/Documents/LLVM/zeno-llvm/build
# export MUSL_ROOT=/opt/riscv_musl
# export CC=${LLVM_ROOT}/bin/clang
# export CFLAGS="--target=riscv64-unknown-linux-gnu \
#   -march=rv64imazzeno0p1 \
#   -menable-experimental-extensions \
#   -mabi=lp64 \
#   -nostdlib \
#   -I${MUSL_ROOT}/include"
# # For IR generation, you don’t need to link, so skip LDFLAGS
# $CC $CFLAGS -O0 -S -emit-llvm -o basic_test.ll basic_test.c
