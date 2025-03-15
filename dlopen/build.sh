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
echo "Using -Wl,--no-as-needed to force-link"
g++ main.c -L. -lmylib -o mainApp

#echo mainApp dependencies:
#ldd mainApp

echo ""
echo Running mainApp:
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
