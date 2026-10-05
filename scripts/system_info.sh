#!/usr/bin/env bash

set -e

echo "========================================"
echo "SYSTEM INFORMATION"
echo "========================================"

echo
echo "Operating system:"
cat /etc/os-release

echo
echo "Architecture:"
uname -m

echo
echo "Kernel:"
uname -r

echo
echo "CPU:"
lscpu | grep -E 'Model name|Имя модели|Architecture|Архитектура|CPU\(s\)'

echo
echo "========================================"
echo "COMPILERS"
echo "========================================"

echo
echo "GCC:"
gcc --version | head -n 1

echo
echo "Clang:"
clang --version | head -n 1

echo
echo "TCC:"
tcc -v 2>&1 | head -n 1 || true
