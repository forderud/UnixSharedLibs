echo Cleaning up...
rm -f *.o *.a *.so mainApp

# explicity set C++11 for compatibility with really old compilers that default to C++98
compile_flags="-std=c++11 -fPIC"

echo ""
echo Building static lib...
g++ $compile_flags -c mystaticlib.cpp -o mystaticlib.o
ar rcs libmystaticlib.a mystaticlib.o

#echo libmystaticlib.a imports:
#nm libmystaticlib.a

echo ""
echo Building shared lib...
g++ $compile_flags -c mysharedlib.cpp -o mysharedlib.o
g++ -shared -static-libgcc -static-libstdc++ -Wl,--version-script=mysharedlib.vers mysharedlib.o libmystaticlib.a -o libmysharedlib.so

echo Transitive shared lib. dependencies:
ldd libmysharedlib.so
#echo Direct shared lib. dependencies:
#readelf -d libmysharedlib.so

echo Building application...
g++ main.cpp -DUSE_DLOPEN -L. -ldl -lmysharedlib -o mainApp

#echo mainApp dependencies:
#ldd mainApp

echo ""
echo Running application...
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
