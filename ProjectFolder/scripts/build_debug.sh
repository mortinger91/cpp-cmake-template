#!/bin/bash
# Script used to build the project in Debug mode.
# build_cmake_debug.sh must be run before this one:
# - the first time the project is built
# - whenever any file is added or removed from the project

if [ "$(uname -s)" == "Linux" ]; then
    cpu_count=$(nproc)
elif [ "$(uname -s)" == "Darwin" ]; then
    cpu_count=$(sysctl -n hw.ncpu)
else
    exit 1
fi

cpu_count=$((cpu_count - 1))
echo "Bulding Debug version using ${cpu_count} threads..."
cmake --build build/Debug/ -j$cpu_count
echo "Finished building Debug!"
