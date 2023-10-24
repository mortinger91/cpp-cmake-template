#!/bin/bash

find ProjectFolder/src/ -iname *.h -o -iname *.cpp | xargs clang-format -i

find ProjectFolder/tests/ -iname *.h -o -iname *.cpp | xargs clang-format -i

# Check if any changes were made by clang-format
if git diff --exit-code; then
  echo "Formatting is ok, no changes applied"
else
  echo "Formatting is wrong, changes have been applied"
  exit 1
fi
