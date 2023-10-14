#!/bin/bash

find ProjectFolder/src/ -iname *.h -o -iname *.cpp | xargs clang-format -i

find ProjectFolder/tests/ -iname *.h -o -iname *.cpp | xargs clang-format -i
