#!/bin/bash
cd "$(dirname "$0")"
set -e # stop on first failure

echo Cleaning up...
rm -f *.o *.a *.so mainApp

echo Building shared C library..
gcc -shared sharedlib.c -o libsharedLib.so

echo Transitive shared lib. dependencies:
ldd libsharedlib.so
echo Direct shared lib. dependencies:
readelf -d libsharedlib.so

echo Building C application...
gcc main.c -L. -pthread -lsharedlib -o mainApp

echo mainApp dependencies:
ldd mainApp

echo ""
echo Running C application...
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
