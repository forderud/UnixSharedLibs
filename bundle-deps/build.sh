#!/bin/bash
cd "$(dirname "$0")"
set -e # stop on first failure

echo Cleaning up...
rm -f *.o *.so a.out

echo Copying C/C++ library dependencies to current folder...
cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6 .

echo ""
echo Building shared C++ lib...
g++ -fPIC -c mysharedlib.cpp -o mysharedlib.o
g++ -shared -pthread mysharedlib.o -Wl,-rpath=. -o libmysharedlib.so

# Add current dir to library search path
export LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH

echo libstdc++.so.6 dependencies:
ldd libstdc++.so.6

echo Transitive shared lib. dependencies:
ldd libmysharedlib.so

echo Building C++ application...
g++ main.cpp -L. -lstdc++ -lmysharedlib -Wl,-rpath=.

#echo executable dependencies:
#ldd a.out

echo ""
echo Running application...
./a.out
