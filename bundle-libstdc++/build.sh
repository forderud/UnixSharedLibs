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

# Alternative mechanism for using bundled libstdc++ version
#export LD_LIBRARY_PATH=`pwd`

#echo Shared lib. dependencies:
#ldd libModernStuff.so
#readelf -d libModernStuff.so

echo Building C++ application with old compiler with outdated libstdc++...
# Passing -nodefaultlibs to avoid auto-linking to GCC-bundled libstdc++ (/usr/lib/gcc/x86_64-linux-gnu/7/libstdc++.so)
# TODO: Switch to -nostdlib++ after upgrading to GCC 13
# Add -Wl,--trace to list linked-to libraries
g++-7 main.cpp -nodefaultlibs -L. -lc `pwd`/libstdc++.so.6 -lModernStuff $link_flags

#echo executable dependencies:
#ldd a.out

echo ""
echo Running application...
./a.out
