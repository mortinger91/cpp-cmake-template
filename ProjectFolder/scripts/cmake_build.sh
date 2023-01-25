#!/bin/bash

echo "Started cmake_build.sh, building CMAKE files..."
rm -r build &> /dev/null
mkdir build
cd build
mkdir debug
mkdir release
cd debug
cmake -DCMAKE_BUILD_TYPE=Debug ../..
cd ..
cd release
cmake -DCMAKE_BUILD_TYPE=Release ../..
echo "Finished building CMAKE files..."
