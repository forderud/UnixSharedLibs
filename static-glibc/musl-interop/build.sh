#!/bin/bash
cd "$(dirname "$0")"
set -e # stop on first failure

# Using "musl-gcc" instead of "gcc" to use the musl C library instead of glibc
# Musl seem to be incompatible with "ldd", so it cannot be used for analyzing dependencies

echo Cleaning up...
rm -f *.o *.a *.so mainApp

echo Building shared C library..
musl-gcc -shared sharedlib.c -o libsharedLib.so

echo Direct shared lib. dependencies:
readelf -d libsharedlib.so

echo Building C application...
# Replace musl-gcc with gcc to trigger "invalid ELF header" crash
musl-gcc main.c -L. -pthread -lsharedlib -o mainApp

echo ""
echo Running C application...
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
