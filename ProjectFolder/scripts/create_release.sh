#!/bin/bash

echo "Started building Release CMAKE files..."
# Clearing build folder if it exists
rm -r build/release &> /dev/null
cmake -SProjectFolder -Bbuild/release -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF
echo "Finished building Release CMAKE files!"


if [ "$(uname -s)" == "Linux" ]; then
	cpu_count=$(grep -c processor /proc/cpuinfo)
elif [ "$(uname -s)" == "Darwin" ]; then
	cpu_count=$(sysctl -a | grep "machdep.cpu.core_count: " | sed 's/^machdep.cpu.core_count: //')
else
	exit 1
fi

cpu_count=$((cpu_count - 1))
echo "Bulding Release version using ${cpu_count} threads..."
cmake --build build/release/ -j$cpu_count
