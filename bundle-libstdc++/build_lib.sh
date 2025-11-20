#!/bin/bash
cd "$(dirname "$0")"
set -e # stop on first failure

echo Cleaning up...
rm -f *.o *.so a.out

# copy C++ library dependencies to current folder so that it becomes bundled with the shared library
cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6 .

link_flags="-Wl,-rpath=\$ORIGIN"

echo ""
echo Building shared C++ lib that uses a recent libstdc++ version...
g++-13 -fPIC -c ModernStuff.cpp -o ModernStuff.o
g++-13 -shared -pthread $link_flags -o libModernStuff.so ModernStuff.o

#echo Shared lib. dependencies:
#ldd libModernStuff.so
#readelf -d libModernStuff.so
