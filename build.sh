#!/usr/bin/env bash
# Builds and runs every C++ lab that is portable (lab14 builds Windows DLLs and is skipped).
set -euo pipefail
cd "$(dirname "$0")"
fail=0
for dir in $(find cpp -name CMakeLists.txt -not -path '*lab14*' -exec dirname {} \; | sort); do
  if cmake -S "$dir" -B "build/$dir" -DCMAKE_BUILD_TYPE=Release >/dev/null && cmake --build "build/$dir" >/dev/null; then
    exe=$(find "build/$dir" -maxdepth 1 -type f -executable | head -1)
    if timeout 10 "$exe" </dev/null >/dev/null; then echo "ok    $dir"; else echo "RUN-FAIL $dir"; fail=1; fi
  else
    echo "BUILD-FAIL $dir"; fail=1
  fi
done
# no CMakeLists: plain compile
dir=cpp/lab10-multiple-inheritance/chess-virtual-vs-nonvirtual
mkdir -p "build/$dir"
c++ -std=c++20 -Wall -o "build/$dir/chess" "$dir"/*.cpp && timeout 10 "build/$dir/chess" </dev/null >/dev/null && echo "ok    $dir" || { echo "FAIL $dir"; fail=1; }
exit $fail
