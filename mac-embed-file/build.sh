echo Cleaning up...
rm -f *.o stub.c mainApp

# convert embed_example.txt into an object file to binary embedding
touch stub.c
g++ -c stub.c -o stub.o
ld -r -sectcreate __TEXT embed_example embed_example.txt -o embed_example.o stub.o

echo Building mainApp...
g++ main.cpp embed_example.o -o mainApp

echo ""
echo Running mainApp:
./mainApp
