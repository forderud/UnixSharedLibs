#!/bin/bash
cd "$(dirname "$0")"

echo Cleaning up...
rm -f mainApp

# Use non-default glibc
link_flags=""
link_flags="-L/usr/local/glibc-2.26/lib -I/usr/local/glibc-2.26/include -Wl,-rpath=/usr/local/glibc-2.26/lib -Wl,-dynamic-linker=/usr/local/glibc-2.26/lib/ld-linux-x86-64.so.2"

echo Building C application...
gcc $link_flags main.c -L. -pthread -o mainApp

echo mainApp dependencies:
ldd mainApp

echo ""
echo Running C application...
./mainApp
