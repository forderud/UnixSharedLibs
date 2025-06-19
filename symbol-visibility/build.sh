echo Cleaning up...
rm *.o
rm *.a
rm *.so
rm mainApp

compile_flags="-fvisibility=hidden -fPIC"

echo ""
echo Building static lib...
g++ $compile_flags -c mystaticlib.cpp -o mystaticlib.o
ar rcs libmystaticlib.a mystaticlib.o

#echo libmystaticlib.a imports:
#nm libmystaticlib.a

echo ""
echo Building shared lib...
g++ $compile_flags -c mysharedlib.cpp -o mysharedlib.o
# Can also pass -Wl,--exclude-libs,libgcc -Wl,--exclude-libs,libstdc++ to export a few more std::exception and std::basic_string types
g++ $compile_flags -shared -static-libgcc -static-libstdc++ mysharedlib.o libmystaticlib.a -o libmysharedlib.so -Wl,--exclude-libs,ALL

echo Transitive shared lib. dependencies:
ldd libmysharedlib.so
#echo Direct shared lib. dependencies:
#readelf -d libmysharedlib.so

echo shared lib. exports:
readelf --symbols --use-dynamic --demangle --wide libmysharedlib.so 

echo Building application...
g++ main.cpp -L. -lmysharedlib -o mainApp

#echo mainApp dependencies:
#ldd mainApp

echo ""
echo Running application...
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
