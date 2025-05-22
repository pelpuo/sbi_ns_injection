#!/bin/bash

# Directories containing source files
LIFTED_DIR="./lifted"
OUTPUT_DIR="./protected_bc"
OUTPUT_DIR2="./protected"
# OUTPUT_DIR="./lifted_x86"

INCLUDE_FILES="/usr/include/stdio.h,/usr/include/stdlib.h,/usr/include/string.h"

# Compiler
# MCTOLL="/home/local/ASUAD/ekayang/Documents/LLVM/llvm-8/llvm-project/build/bin/llvm-mctoll"
MCTOLL="/home/local/ASUAD/ekayang/Documents/LLVM/llvm-mctoll/llvm-project/build/bin/llvm-mctoll"

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Function to compile .c files in a directory
lift_bins() {
    local dir=$1
    for file in "$dir"/*.ll; do
        if [[ -f $file ]]; then
            filename=$(basename -- "$file")
            output_file="$OUTPUT_DIR/${filename%.*}.bc"
            echo "injecting $file -> $output_file"
            /home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/bin/opt \
            -opaque-pointers=0 \
            --load-pass-plugin=./passes/SplitRodataPass.so \
            --load-pass-plugin=./passes/NSInjectionPass.so \
            --load-pass-plugin=./passes/HeapPass.so \
            --passes="split-rodata,function(ns-reorder),function(replace-libcalls)" \
            $file \
            -o $output_file

            /home/local/ASUAD/ekayang/Documents/LLVM/llvm-15/llvm-project/build/bin/llvm-dis $output_file -o $OUTPUT_DIR2/${filename%.*}.ll
        fi
    done
}

# Compile .c files in both directories
lift_bins "$LIFTED_DIR"

echo "Compilation completed. Output stored in $OUTPUT_DIR2."