echo Cleaning up...
rm *.o
rm *.so
rm mainApp

echo Building libmylib.so...
g++ -fPIC -c mylib.cpp -o mylib.o
g++ -shared -o libmylib.so mylib.o

#echo libmylib.so dependencies:
#ldd libmylib.so

echo Building mainApp...
g++ main.cpp -L. -lmylib -o mainApp

#echo mainApp dependencies:
#ldd mainApp

echo Running mainApp:
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp

