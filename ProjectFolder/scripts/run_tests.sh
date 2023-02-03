#!/bin/bash

echo "Running tests..."
ProjectFolder/scripts/cmake_build.sh && \
ProjectFolder/scripts/make_debug.sh && \
make test -C ProjectFolder/build/debug
echo "Finished running tests..."
