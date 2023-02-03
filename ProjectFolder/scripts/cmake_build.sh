#!/bin/bash

echo "Started cmake_build.sh, building CMAKE files..."
rm -r build &> /dev/null
mkdir ProjectFolder/build
mkdir ProjectFolder/build/debug
mkdir ProjectFolder/build/release
cd ProjectFolder/build/debug
cmake -DCMAKE_BUILD_TYPE=Debug ../..
cd ../release
cmake -DCMAKE_BUILD_TYPE=Release ../..
echo "Finished building CMAKE files..."
