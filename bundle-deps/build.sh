#!/bin/bash
cd "$(dirname "$0")"
set -e # stop on first failure

echo Cleaning up...
rm -f *.o *.so a.out

echo Copying C/C++ library dependencies to current folder...
cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6 .

compile_flags="-std=c++17" # "-fabi-version=11" GCC 7 ABI
link_flags="-Wl,-rpath=."  #"-Wl,--dynamic-linker=/lib64/ld-linux-x86-64.so.2"

echo ""
echo Building shared C++ lib...
g++ -fPIC $compile_flags -c mysharedlib.cpp -o mysharedlib.o
g++ -shared -pthread mysharedlib.o $link_flags -o libmysharedlib.so

# Attempts on enabling the bundled libstdc++ version
export LD_LIBRARY_PATH=`pwd`
#export LD_PRELOAD=/host/bundle-deps/libstdc++.so.6

#echo libstdc++.so.6 dependencies:
#ldd libstdc++.so.6

echo Shared lib. dependencies:
ldd libmysharedlib.so
#readelf -d libmysharedlib.so

echo Building C++ application...
g++ $compile_flags main.cpp -L. -lstdc++ -lmysharedlib $link_flags

#echo executable dependencies:
#ldd a.out

echo ""
echo Running application...
./a.out
