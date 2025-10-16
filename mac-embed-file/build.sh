echo Cleaning up...
rm -f *.o stub.c mainApp

# convert embed_example.txt into an object file to binary embedding
g++ -c mystaticlib.cpp -o lib_sources.o
ld  lib_sources.o -r -sectcreate __TEXT embed_example embed_example.txt -o mystaticlib.o

echo Building mainApp...
g++ main.cpp mystaticlib.o -o mainApp

echo ""
echo Running mainApp:
./mainApp
