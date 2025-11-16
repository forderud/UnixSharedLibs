#!/bin/bash
cd "$(dirname "$0")"
set -e # stop on first failure

echo Cleaning up...
rm -f *.o *.so a.out

echo ""
echo Building shared C++ lib...
g++ -fPIC -c mysharedlib.cpp -o mysharedlib.o
g++ -shared -static-libgcc -pthread mysharedlib.o -o libmysharedlib.so

echo Transitive shared lib. dependencies:
ldd libmysharedlib.so
echo Direct shared lib. dependencies:
readelf -d libmysharedlib.so

# copy libstdc++ library to current folder
cp /lib/x86_64-linux-gnu/libstdc++.so.6 .
cp /lib/x86_64-linux-gnu/libc.so.6 .

echo libstdc++.so.6 dependencies:
ldd libstdc++.so.6

echo Building C++ application...
# Optional define: -DUSE_DLOPEN
g++ main.cpp -L. -ldl -lstdc++ -lmysharedlib -Wl,-rpath=.

#echo executable dependencies:
#ldd a.out

echo ""
echo Running application...
export LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH
./a.out
