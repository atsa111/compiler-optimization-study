#!/usr/bin/env bash

set -euo pipefail

echo "========================================"
echo "ShellCheck"
echo "========================================"

shellcheck \
    scripts/build.sh \
    scripts/benchmark.sh \
    scripts/system_info.sh \
    scripts/lint.sh \
    tests/run_tests.sh

echo
echo "========================================"
echo "Project C sources"
echo "========================================"

if find src -type f -name '*.c' -print -quit | grep -q .; then
    find src -type f -name '*.c' -print0 |
        xargs -0 cppcheck \
            --error-exitcode=1 \
            --enable=warning,style,performance,portability \
            --suppress=missingIncludeSystem
else
    echo "No original C sources in src/ yet."
fi

echo
echo "========================================"
echo "Historical benchmark (informational)"
echo "========================================"

cppcheck \
    -DNO_ZERO_DIVIDE \
    --enable=warning,performance,portability \
    --suppress=missingIncludeSystem \
    third_party/optbench.c || true

echo
echo "Lint completed."
