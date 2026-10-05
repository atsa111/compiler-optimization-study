#!/usr/bin/env bash

set -euo pipefail

mkdir -p results/sizes
mkdir -p results/timings

SIZE_FILE="results/sizes/optbench.txt"
SECTION_FILE="results/sizes/sections.txt"
TIME_FILE="results/timings/optbench.txt"

echo "Executable size comparison" > "$SIZE_FILE"
echo "==========================" >> "$SIZE_FILE"

for program in \
    build/gcc_O0 \
    build/gcc_O1 \
    build/gcc_O2 \
    build/gcc_O3 \
    build/gcc_Os \
    build/clang_O0 \
    build/clang_O1 \
    build/clang_O2 \
    build/clang_O3 \
    build/clang_Os \
    build/tcc
do
    if [ -x "$program" ]; then
        printf "%-20s %s bytes\n" \
            "$(basename "$program")" \
            "$(stat -c%s "$program")" \
            >> "$SIZE_FILE"
    fi
done

echo "Executable section sizes" > "$SECTION_FILE"
echo "========================" >> "$SECTION_FILE"

size \
    build/gcc_O0 \
    build/gcc_O1 \
    build/gcc_O2 \
    build/gcc_O3 \
    build/gcc_Os \
    build/clang_O0 \
    build/clang_O1 \
    build/clang_O2 \
    build/clang_O3 \
    build/clang_Os \
    build/tcc \
    >> "$SECTION_FILE"

echo "Runtime comparison" > "$TIME_FILE"
echo "==================" >> "$TIME_FILE"

for program in \
    build/gcc_O0 \
    build/gcc_O2 \
    build/gcc_Os \
    build/clang_O0 \
    build/clang_O2 \
    build/clang_Os \
    build/tcc
do
    if [ -x "$program" ]; then
        {
            echo "===== $(basename "$program") ====="

            /usr/bin/time \
                -f "real=%e user=%U sys=%S" \
                "$program" \
                >/dev/null

            echo
        } >> "$TIME_FILE" 2>&1
    fi
done

echo "Benchmark completed."
echo "Sizes:    $SIZE_FILE"
echo "Sections: $SECTION_FILE"
echo "Timings:  $TIME_FILE"
