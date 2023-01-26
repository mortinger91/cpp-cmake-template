#!/bin/bash

if [ $(uname -s) == "Linux" ]; then
	cpu_count=$(grep -c processor /proc/cpuinfo)
elif [ $(uname -s) == "Darwin" ]; then
	cpu_count=$(sysctl -a | grep "machdep.cpu.core_count: " | sed 's/^machdep.cpu.core_count: //')
else
	exit 1
fi

cpu_count=$((cpu_count - 1))
echo "Bulding Release version using ${cpu_count} threads..."
cmake --build ProjectFolder/build/release/ -j$cpu_count
