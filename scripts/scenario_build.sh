#!/usr/bin/env bash

set -euo pipefail

TESTS=(
    bitmask
    ring_buffer
    crc32
    low_pass_filter
)

mkdir -p build/scenario
mkdir -p asm/scenario/gcc
mkdir -p asm/scenario/clang
mkdir -p asm/scenario/tcc

for test in "${TESTS[@]}"
do
    source_file="src/${test}.c"

    echo "========================================"
    echo "TEST: $test"
    echo "========================================"

    echo "GCC..."

    gcc -O0 "$source_file" \
        -o "build/scenario/gcc_${test}_O0"

    gcc -O2 "$source_file" \
        -o "build/scenario/gcc_${test}_O2"

    gcc -Os "$source_file" \
        -o "build/scenario/gcc_${test}_Os"

    gcc -O0 -S "$source_file" \
        -o "asm/scenario/gcc/${test}_O0.s"

    gcc -O2 -S "$source_file" \
        -o "asm/scenario/gcc/${test}_O2.s"

    gcc -Os -S "$source_file" \
        -o "asm/scenario/gcc/${test}_Os.s"

    echo "Clang..."

    clang -O0 "$source_file" \
        -o "build/scenario/clang_${test}_O0"

    clang -O2 "$source_file" \
        -o "build/scenario/clang_${test}_O2"

    clang -Os "$source_file" \
        -o "build/scenario/clang_${test}_Os"

    clang -O0 -S "$source_file" \
        -o "asm/scenario/clang/${test}_O0.s"

    clang -O2 -S "$source_file" \
        -o "asm/scenario/clang/${test}_O2.s"

    clang -Os -S "$source_file" \
        -o "asm/scenario/clang/${test}_Os.s"

    echo "TCC..."

    tcc -O0 "$source_file" \
        -o "build/scenario/tcc_${test}_O0"

    tcc -O2 "$source_file" \
        -o "build/scenario/tcc_${test}_O2"

    objdump -d -Mintel \
        "build/scenario/tcc_${test}_O0" \
        > "asm/scenario/tcc/${test}_O0.txt"

    objdump -d -Mintel \
        "build/scenario/tcc_${test}_O2" \
        > "asm/scenario/tcc/${test}_O2.txt"

done

echo
echo "Scenario build completed."
