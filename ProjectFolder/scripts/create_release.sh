#!/bin/bash
# Script used to build CMake Release files.
# Calling this script without args will not build tests.
# To build test call this script with "withTests" argument 

echo "Started building Release CMAKE files..."
# Clearing build folder if it exists
rm -r build/release &> /dev/null

echo "Deciding if tests need to be built..."
if [ -n "$1" ]; then
    if [ "$1" == "withTests" ]; then
        BUILD_TESTS="ON"
        echo "Building with tests"
    fi
else
    BUILD_TESTS="OFF"
    echo "Building without tests"
fi

cmake -SProjectFolder --preset Release -DBUILD_TESTS=$BUILD_TESTS
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
echo "Finished building Release!"
