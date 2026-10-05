#!/usr/bin/env bash

set -euo pipefail

SOURCE="third_party/optbench.c"

mkdir -p build
mkdir -p asm/gcc
mkdir -p asm/clang
mkdir -p asm/tcc

echo "========================================"
echo "GCC"
echo "========================================"

gcc -DNO_ZERO_DIVIDE -O0 "$SOURCE" -o build/gcc_O0
gcc -DNO_ZERO_DIVIDE -O1 "$SOURCE" -o build/gcc_O1
gcc -DNO_ZERO_DIVIDE -O2 "$SOURCE" -o build/gcc_O2
gcc -DNO_ZERO_DIVIDE -O3 "$SOURCE" -o build/gcc_O3
gcc -DNO_ZERO_DIVIDE -Os "$SOURCE" -o build/gcc_Os

gcc -DNO_ZERO_DIVIDE -O0 -S "$SOURCE" -o asm/gcc/optbench_O0.s
gcc -DNO_ZERO_DIVIDE -O1 -S "$SOURCE" -o asm/gcc/optbench_O1.s
gcc -DNO_ZERO_DIVIDE -O2 -S "$SOURCE" -o asm/gcc/optbench_O2.s
gcc -DNO_ZERO_DIVIDE -O3 -S "$SOURCE" -o asm/gcc/optbench_O3.s
gcc -DNO_ZERO_DIVIDE -Os -S "$SOURCE" -o asm/gcc/optbench_Os.s

echo
echo "========================================"
echo "CLANG"
echo "========================================"

clang -DNO_ZERO_DIVIDE -O0 "$SOURCE" -o build/clang_O0
clang -DNO_ZERO_DIVIDE -O1 "$SOURCE" -o build/clang_O1
clang -DNO_ZERO_DIVIDE -O2 "$SOURCE" -o build/clang_O2
clang -DNO_ZERO_DIVIDE -O3 "$SOURCE" -o build/clang_O3
clang -DNO_ZERO_DIVIDE -Os "$SOURCE" -o build/clang_Os

clang -DNO_ZERO_DIVIDE -O0 -S "$SOURCE" -o asm/clang/optbench_O0.s
clang -DNO_ZERO_DIVIDE -O1 -S "$SOURCE" -o asm/clang/optbench_O1.s
clang -DNO_ZERO_DIVIDE -O2 -S "$SOURCE" -o asm/clang/optbench_O2.s
clang -DNO_ZERO_DIVIDE -O3 -S "$SOURCE" -o asm/clang/optbench_O3.s
clang -DNO_ZERO_DIVIDE -Os -S "$SOURCE" -o asm/clang/optbench_Os.s

echo
echo "========================================"
echo "TCC"
echo "========================================"

tcc -DNO_ZERO_DIVIDE "$SOURCE" -o build/tcc

echo
echo "========================================"
echo "BUILD COMPLETED"
echo "========================================"
