echo Cleaning up...
rm -f *.o *.a mainApp

# build static library that embeds a binary file
g++ -c mystaticlib.cpp -o lib_sources.o
ld  lib_sources.o -r -sectcreate __TEXT embed_example embed_example.txt -o mystaticlib.o
libtool -static mystaticlib.o -o mystaticlib.a

echo Building mainApp...
g++ main.cpp mystaticlib.a -o mainApp

echo ""
echo Running mainApp:
./mainApp
