#!/bin/bash

echo "Running tests..."
ProjectFolder/scripts/cmake_build.sh
ProjectFolder/scripts/make_debug.sh
cd ProjectFolder/build/debug
make test
echo "Finished running tests..."
