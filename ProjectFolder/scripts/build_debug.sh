#!/bin/bash

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
