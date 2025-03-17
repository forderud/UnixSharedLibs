echo Cleaning up...
rm *.o
rm *.so
rm mainApp

echo ""
echo Building libmysharedlib.so...
# explicity set C++11 for compatibility with really old compilers that default to C++98
g++ -std=c++11 -fPIC -c mysharedlib.cpp -o mysharedlib.o
# static linking to libgcc & libstdc++ to reduce run-time dependencies
g++ -shared -static-libgcc -static-libstdc++ -o libmysharedlib.so mysharedlib.o

#echo libmysharedlib.so dependencies:
#ldd libmysharedlib.so

echo Building mainApp...
g++ main.c -DUSE_DLOPEN -L. -ldl -lmysharedlib -o mainApp

#echo mainApp dependencies:
#ldd mainApp

echo ""
echo Running mainApp:
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
