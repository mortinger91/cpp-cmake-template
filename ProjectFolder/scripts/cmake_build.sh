#!/bin/bash

echo "Started cmake_build.sh, building CMAKE files..."
# cd ProjectFolder
# This command also generates clang compile commands here:
# ProjectFolder/build/debug/compile_commands.json
cmake -SProjectFolder -Bbuild/debug -DCMAKE_BUILD_TYPE=Debug
echo "Finished building CMAKE files..."
