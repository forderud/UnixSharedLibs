echo Cleaning up...
rm *.o
rm *.a
rm *.so
rm mainApp

# explicity set C++11 for compatibility with really old compilers that default to C++98

echo ""
echo Building mystaticlib.a...
g++ -std=c++11 -fPIC -c mystaticlib.cpp -o mystaticlib.o
ar rcs libmystaticlib.a mystaticlib.o

#echo libmystaticlib.a imports:
#nm libmystaticlib.a

echo ""
echo Building libmysharedlib.so...
g++ -std=c++11 -fPIC -c mysharedlib.cpp -o mysharedlib.o
# use "whole-archive" linking of libmystaticlib to avoid unreferenced compute_sum_static error
g++ -shared -static-libgcc -static-libstdc++ -Wl,--whole-archive libmystaticlib.a -Wl,--no-whole-archive -o libmysharedlib.so mysharedlib.o

echo libmysharedlib.so dependencies:
ldd libmysharedlib.so

echo Building mainApp...
g++ main.cpp -DUSE_DLOPEN -L. -ldl -lmysharedlib -o mainApp

#echo mainApp dependencies:
#ldd mainApp

echo ""
echo Running mainApp:
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
