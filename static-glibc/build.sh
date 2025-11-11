#!/bin/bash
cd "$(dirname "$0")"
set -e # stop on first failure

echo Cleaning up...
rm -f *.o *.a *.so mainApp

# Use non-default glibc
# export LD_LIBRARY_PATH=/usr/local/glibc-2.26/lib:$LD_LIBRARY_PATH
link_flags=""
#link_flags="-L/usr/local/glibc-2.26/lib -I/usr/local/glibc-2.26/include -Wl,-rpath=/usr/local/glibc-2.26/lib -Wl,-dynamic-linker=/usr/local/glibc-2.26/lib/ld-linux-x86-64.so.2"
#PATH="/usr/local/glibc-2.26/lib/bin:${PATH}"

compile_flags=""
#compile_flags="$compile_flags -isystem /usr/local/glibc-2.26/include"

echo ""
echo Building static C++ lib...
g++ $compile_flags -c mystaticlib.cpp -o mystaticlib.o
ar rcs libmystaticlib.a mystaticlib.o

#echo libmystaticlib.a imports:
#nm libmystaticlib.a

echo ""
echo Building shared C++ lib...
g++ $compile_flags -fPIC -c mysharedlib.cpp -o mysharedlib.o
sharedlib_flags="-Wl,-Bsymbolic -Wl,-Bsymbolic-functions" # TODO: Learn how to use these flags
g++ $link_flags -shared -static-libgcc -static-libstdc++ -Wl,--version-script=mysharedlib.vers $sharedlib_flags -pthread mysharedlib.o libmystaticlib.a -o libmysharedlib.so

echo Transitive shared lib. dependencies:
ldd libmysharedlib.so
echo Direct shared lib. dependencies:
readelf -d libmysharedlib.so

echo Building C++ application...
# Optional define: -DUSE_DLOPEN
g++ $link_flags main.cpp -L. -ldl -lmysharedlib -o mainApp

#echo mainApp dependencies:
#ldd mainApp

echo ""
echo Running application...
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
