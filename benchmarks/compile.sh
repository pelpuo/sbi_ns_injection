#!/bin/bash

# Directories containing source files
SPATIAL_DIR="./spatial_safety"
TEMPORAL_DIR="./temporal_safety"
OUTPUT_DIR="./bin"

# Compiler
# COMPILER="riscv64-unknown-elf-gcc"
# COMPILER="gcc"
# COMPILER="clang --target=riscv64-unknown-linux-gnu -march=rv64imafd -mabi=lp64d --gcc-toolchain=/opt/riscv_ima -O0 --sysroot=/opt/riscv_ima/sysroot"
COMPILER="clang"

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Function to compile .c files in a directory
compile_files() {
    local dir=$1
    for file in "$dir"/*.c; do
        if [[ -f $file ]]; then
            filename=$(basename -- "$file")
            output_file="$OUTPUT_DIR/${filename%.*}"
            echo "Compiling $file -> $output_file"
            $COMPILER "$file" -o "$output_file"
        fi
    done
}

# Compile .c files in both directories
compile_files "$SPATIAL_DIR"
compile_files "$TEMPORAL_DIR"

echo "Compilation completed. Output stored in $OUTPUT_DIR."