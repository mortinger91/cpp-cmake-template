#!/bin/bash

echo "Running tests..."
ProjectFolder/scripts/make_debug.sh && \
ctest --test-dir ProjectFolder/build
echo "Finished running tests..."
