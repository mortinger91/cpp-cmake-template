#!/bin/bash

echo "Started building Release CMAKE files..."
# Clearing build folder if it exists
rm -r build/release &> /dev/null
cmake -SProjectFolder --preset Release -DBUILD_TESTS=OFF
echo "Finished building Release CMAKE files!"


if [ "$(uname -s)" == "Linux" ]; then
	cpu_count=$(nproc)
elif [ "$(uname -s)" == "Darwin" ]; then
	cpu_count=$(sysctl -n hw.ncpu)
else
	exit 1
fi

cpu_count=$((cpu_count - 1))
echo "Bulding Release version using ${cpu_count} threads..."
cmake --build build/Release/ -j$cpu_count
