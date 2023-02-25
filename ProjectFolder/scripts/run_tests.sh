#!/bin/bash

echo "Running tests..."
ProjectFolder/scripts/make_debug.sh && \
ctest --output-on-failure --test-dir build/debug/tests
RESULT=$(echo $?)
echo "Finished running tests..."
exit $RESULT
