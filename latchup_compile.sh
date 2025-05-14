#!/bin/bash

#/opt/llvm-zeno/bin/clang  -no-pie -nostartfiles --target=riscv64-unknown-linux-gnu -march=rv64imazzeno0p1 -menable-experimental-extensions -mabi=lp64 -nostdlib --gcc-toolchain=/opt/xbgas_ima_linux -Iscripts/ -static -c -o scripts/code.o scripts/code.c

#riscv64-unknown-linux-gnu-ld -z max-page-size=4096 -Ttext 0x0 -e main scripts/code.o scripts/print.o scripts/uart.o scripts/string.o scripts/zlib.o -o app 

CC_ARGS="--target=riscv64-unknown-elf -O0 "
CC_ARGS+="-march=rv64imazzeno0p1 -menable-experimental-extensions -mabi=lp64 "
#CC_ARGS+="-march=rv64ima -mabi=lp64 "

CC_ARGS_1="-I/opt/xbgas_ima/riscv64-unknown-elf/sys-include/ -Iscripts/lib/include "

LIB_ARGS="-lzeno "
LIB_ARGS+="-lgcc "
LIB_ARGS+="--start-group "
LIB_ARGS+="-lc "
LIB_ARGS+="-luserlib "
LIB_ARGS+="--end-group "

CRT_ARGS_1="/opt/xbgas_ima/lib/gcc/riscv64-unknown-elf/7.1.1/../../../../riscv64-unknown-elf/lib/crt0.o "
CRT_ARGS_1+="/opt/xbgas_ima/lib/gcc/riscv64-unknown-elf/7.1.1/crtbegin.o "
CRT_ARGS_1+="-L/opt/xbgas_ima/lib/gcc/riscv64-unknown-elf/7.1.1 "
CRT_ARGS_1+="-L/opt/xbgas_ima/lib/gcc/riscv64-unknown-elf/7.1.1/../../../../riscv64-unknown-elf/lib "
CRT_ARGS_2+="-lgcc /opt/xbgas_ima/lib/gcc/riscv64-unknown-elf/7.1.1/crtend.o "

# mkdir -p src/$3

# rm src/$3/*.ll src/$3/*.o src/$3/app 2>/dev/null 1>/dev/null

# if [ "$1" == "enable" ]; then
#     echo "Adding zeno dependencies"
#     ./scripts/fix_zeno_deps $3
# fi

# /home/mpaul16/llvm_zeno/bin/clang $CC_ARGS $CC_ARGS_1 -S -emit-llvm -o src/$3/stack_prog.ll src/$3/code.c
/home/mpaul16/llvm_zeno/bin/clang $CC_ARGS $CC_ARGS_1 -S -emit-llvm -o basic_test.ll basic_test.c
/home/mpaul16/llvm_zeno/bin/clang $CC_ARGS $CC_ARGS_1 -S -o basic_test.s basic_test.ll

# if [ "$1" == "enable" ]; then
#     echo "Adding stack namespaces"
#     ./scripts/railbin src/$3/stack_prog.ll src/$3/new_stack_prog.ll
# else
#     echo "Skipped stack namespaces"
#     mv src/$3/stack_prog.ll src/$3/new_stack_prog.ll
# fi

# mv src/$3/new_stack_prog.ll src/$3/hpc_prog.ll

# if [ "$2" == "enable" ]; then
#     echo "Adding hpc monitoring"
#     ./scripts/hpc src/$3/hpc_prog.ll src/$3/new_hpc_prog.ll
# else
#     echo "Skipped hpc monitoring"
#     mv src/$3/hpc_prog.ll src/$3/new_hpc_prog.ll
# fi


# /home/mpaul16/llvm_zeno/bin/clang -static $CC_ARGS  src/$3/new_hpc_prog.ll -c -o src/$3/code.o

# /opt/xbgas_ima/bin/riscv64-unknown-elf-ld -static -o src/$3/app -Lscripts/lib $CRT_ARGS_1 src/$3/code.o $LIB_ARGS $CRT_ARGS_2
