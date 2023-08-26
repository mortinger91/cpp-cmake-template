#!/bin/bash

if [ "$(uname -s)" == "Linux" ]; then
	cpu_count=$(nproc)
elif [ "$(uname -s)" == "Darwin" ]; then
	cpu_count=$(sysctl -n hw.ncpu)
else
	exit 1
fi

echo "Running tests using ${cpu_count} threads..."
ProjectFolder/scripts/build_debug.sh && \
ctest --output-on-failure --test-dir build/Debug/tests -j$cpu_count
RESULT=$?
echo "Finished running tests..."
exit "${RESULT}"
