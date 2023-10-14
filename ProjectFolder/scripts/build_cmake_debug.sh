#!/bin/bash
# Script used to build CMake Debug files

echo "Started building Debug CMake files..."

# Clearing build folder if it exists
rm -r build/debug &> /dev/null

# This command also generates clang compile commands here:
# ProjectFolder/build/debug/compile_commands.json
cmake -SProjectFolder --preset Debug -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DCMAKE_C_COMPILER=/usr/bin/clang
echo "Finished building Debug CMake files!"
