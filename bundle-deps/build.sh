#!/bin/bash
cd "$(dirname "$0")"
set -e # stop on first failure

echo Cleaning up...
rm -f *.o *.so a.out

echo Copying C/C++ library dependencies to current folder...
cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6 .

compile_flags="" #-std=c++17" # "-fabi-version=11" # GCC 7 ABI
link_flags="-Wl,-rpath=\$ORIGIN"

echo ""
echo Building shared C++ lib...
g++-13 -fPIC $compile_flags -c mysharedlib.cpp -o mysharedlib.o
g++-13 -shared -pthread $link_flags -o libmysharedlib.so mysharedlib.o

# Use bundled libstdc++ version
#export LD_LIBRARY_PATH=`pwd`

#echo libstdc++.so.6 dependencies:
#ldd libstdc++.so.6
#readelf -d libstdc++.so.6

echo Shared lib. dependencies:
ldd libmysharedlib.so
#readelf -d libmysharedlib.so

echo Building C++ application...
# Passing -nodefaultlibs to avoid auto-linking to /usr/lib/gcc/x86_64-linux-gnu/7/libstdc++.so
# Add -Wl,--trace to list linked-to libraries
g++-7 $compile_flags main.cpp -nodefaultlibs -L. -lc -lmysharedlib $link_flags

#echo executable dependencies:
#ldd a.out

echo ""
echo Running application...
./a.out
