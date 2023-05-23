#!/bin/bash

if [ "$(uname -s)" == "Linux" ]; then
	cpu_count=$(grep -c processor /proc/cpuinfo)
elif [ "$(uname -s)" == "Darwin" ]; then
	cpu_count=$(sysctl -a | grep "machdep.cpu.core_count: " | sed 's/^machdep.cpu.core_count: //')
else
	exit 1
fi

echo "Running tests using ${cpu_count} threads..."
ProjectFolder/scripts/build_debug.sh && \
ctest --output-on-failure --test-dir build/debug/tests -j$cpu_count
RESULT=$?
echo "Finished running tests..."
exit "${RESULT}"
