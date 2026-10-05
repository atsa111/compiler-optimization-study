#!/usr/bin/env bash

set -euo pipefail

TESTS=(
    bitmask
    ring_buffer
    crc32
    low_pass_filter
)

mkdir -p results/scenario/sizes
mkdir -p results/scenario/timings

SIZE_FILE="results/scenario/sizes/sizes.txt"
SECTION_FILE="results/scenario/sizes/sections.txt"

: > "$SIZE_FILE"
: > "$SECTION_FILE"

for test in "${TESTS[@]}"
do
    {
        echo "========================================"
        echo "$test"
        echo "========================================"

        for binary in \
            "build/scenario/gcc_${test}_O0" \
            "build/scenario/gcc_${test}_O2" \
            "build/scenario/gcc_${test}_Os" \
            "build/scenario/clang_${test}_O0" \
            "build/scenario/clang_${test}_O2" \
            "build/scenario/clang_${test}_Os" \
            "build/scenario/tcc_${test}_O0" \
            "build/scenario/tcc_${test}_O2"
        do
            printf "%-35s %s bytes\n" \
                "$(basename "$binary")" \
                "$(stat -c%s "$binary")"
        done

        echo
    } >> "$SIZE_FILE"

    {
        echo "========================================"
        echo "$test"
        echo "========================================"

        size \
            "build/scenario/gcc_${test}_O0" \
            "build/scenario/gcc_${test}_O2" \
            "build/scenario/gcc_${test}_Os" \
            "build/scenario/clang_${test}_O0" \
            "build/scenario/clang_${test}_O2" \
            "build/scenario/clang_${test}_Os" \
            "build/scenario/tcc_${test}_O0" \
            "build/scenario/tcc_${test}_O2"

        echo
    } >> "$SECTION_FILE"
done

echo "Scenario size measurements completed."
