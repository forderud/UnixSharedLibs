echo Cleaning up...
rm *.o
rm *.a
rm *.so
rm mainApp

# explicity set C++11 for compatibility with really old compilers that default to C++98

echo ""
echo Building static lib...
g++ -std=c++11 -fPIC -c mystaticlib.cpp -o mystaticlib.o
ar rcs libmystaticlib.a mystaticlib.o

#echo libmystaticlib.a imports:
#nm libmystaticlib.a

echo ""
echo Building shared lib...
g++ -std=c++11 -fPIC -c mysharedlib.cpp -o mysharedlib.o
g++ -shared -static-libgcc -static-libstdc++ mysharedlib.o libmystaticlib.a -o libmysharedlib.so

echo libmysharedlib.so dependencies:
ldd libmysharedlib.so

echo Building application...
g++ main.cpp -DUSE_DLOPEN -L. -ldl -lmysharedlib -o mainApp

#echo mainApp dependencies:
#ldd mainApp

echo ""
echo Running application...
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
