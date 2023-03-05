#!/bin/bash

echo "Started building Debug CMAKE files..."
# Clearing build folder if it exists
rm -r build/debug &> /dev/null
# This command also generates clang compile commands here:
# ProjectFolder/build/debug/compile_commands.json
cmake -SProjectFolder -Bbuild/debug -DCMAKE_BUILD_TYPE=Debug
echo "Finished building Debug CMAKE files!"
