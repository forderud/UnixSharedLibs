#!/bin/bash
cd "$(dirname "$0")"
set -e # stop on first failure

echo Cleaning up...
rm -f *.so a.out

# build shared lib.
# links to static libstdc++ to avoid run-time dependency
g++ -fPIC -static-libstdc++ -shared libfoo.cpp -o libfoo.so -Wl,--exclude-libs,ALL -pthread

# build app that links to shared lib
g++ main.cpp -L. -lfoo -Wl,-rpath=. -pthread -O2


echo ""
echo "Running application that will segfault on startup..."
./a.out
