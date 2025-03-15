echo Cleaning up...
rm *.o
rm *.so
rm mainApp

echo ""
echo Building libmylib.so...
g++ -fPIC -c mylib.c -o mylib.o
g++ -shared -o libmylib.so mylib.o

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
