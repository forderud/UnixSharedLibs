echo Cleaning up...
rm -f *.o stub.c mainApp

# convert embed_example.txt into an object file to binary embedding
g++ -c mystaticlib.cpp -o stub.o
ld  stub.o -r -sectcreate __TEXT embed_example embed_example.txt -o embed_example.o

echo Building mainApp...
g++ main.cpp embed_example.o -o mainApp

echo ""
echo Running mainApp:
./mainApp
