echo Cleaning up...
rm -f *.o *.so mainApp

echo ""
echo Building libmylib.so...
g++ -fPIC -c mylib.cpp -o mylib.o
g++ -shared -o libmylib.so mylib.o

#echo libmylib.so dependencies:
#ldd libmylib.so

echo Building mainApp...
echo "Using -Wl,--no-as-needed to force-link"
g++ main.cpp -L. -Wl,--no-as-needed -lmylib -Wl,-rpath=. -o mainApp

#echo mainApp dependencies:
#ldd mainApp

echo ""
echo Running mainApp:
./mainApp

