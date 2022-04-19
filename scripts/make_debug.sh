#!/bin/bash

cpu_count=$(grep -c processor /proc/cpuinfo)
cpu_count=$((cpu_count + 1))
echo Bulding Debug version using $cpu_count threads...
cmake --build build/debug/ -j$cpu_count
