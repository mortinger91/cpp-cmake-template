#!/bin/bash

echo "Running tests..."
ProjectFolder/scripts/make_debug.sh && \
ctest --test-dir ProjectFolder/build/debug
echo "Finished running tests..."
