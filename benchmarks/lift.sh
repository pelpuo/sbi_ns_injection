#!/bin/bash

# Directories containing source files
BIN_DIR="./bin"
OUTPUT_DIR="./lifted"
# OUTPUT_DIR="./lifted_x86"

INCLUDE_FILES="/usr/include/stdio.h,/usr/include/stdlib.h,/usr/include/string.h"

# Compiler
MCTOLL="/home/local/ASUAD/ekayang/Documents/LLVM/llvm-8/llvm-project/build/bin/llvm-mctoll"

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Function to compile .c files in a directory
lift_bins() {
    local dir=$1
    for file in "$dir"/*; do
        if [[ -f $file ]]; then
            filename=$(basename -- "$file")
            output_file="$OUTPUT_DIR/${filename%.*}.ll"
            echo "lifting $file -> $output_file"
            $MCTOLL "$file" -I "/usr/include/stdio.h" -I "/usr/include/stdlib.h" -I "/usr/include/string.h" -o "$output_file"
        fi
    done
}

# Compile .c files in both directories
lift_bins "$BIN_DIR"

echo "Compilation completed. Output stored in $OUTPUT_DIR."