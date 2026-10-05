#!/usr/bin/env bash

set -euo pipefail

SOURCE="third_party/optbench.c"

echo "========================================"
echo "TEST: GCC"
echo "========================================"

gcc -DNO_ZERO_DIVIDE -Wall -Wextra \
    "$SOURCE" \
    -o /tmp/optbench_gcc_test

/tmp/optbench_gcc_test > /dev/null

echo "========================================"
echo "TEST: CLANG"
echo "========================================"

clang -DNO_ZERO_DIVIDE -Wall -Wextra \
    "$SOURCE" \
    -o /tmp/optbench_clang_test

/tmp/optbench_clang_test > /dev/null

echo "========================================"
echo "TEST: TCC"
echo "========================================"

tcc -DNO_ZERO_DIVIDE \
    "$SOURCE" \
    -o /tmp/optbench_tcc_test

/tmp/optbench_tcc_test > /dev/null

rm -f \
    /tmp/optbench_gcc_test \
    /tmp/optbench_clang_test \
    /tmp/optbench_tcc_test

echo
echo "All build and execution tests passed."
