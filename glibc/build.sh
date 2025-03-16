echo Cleaning up...
rm *.o
rm *.so
rm mainApp

echo ""
echo Building libmylib.so...
# explicity set C++11 for compatibility with really old compilers that default to C++98
g++ -std=c++11 -fPIC -c mylib.c -o mylib.o
# static linking to libgcc & libstdc++ to reduce run-time dependencies
g++ -shared -static-libgcc -static-libstdc++ -o libmylib.so mylib.o

#echo libmylib.so dependencies:
#ldd libmylib.so

echo Building mainApp...
g++ main.c -DUSE_DLOPEN -L. -ldl -lmylib -o mainApp

#echo mainApp dependencies:
#ldd mainApp

echo ""
echo Running mainApp:
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
