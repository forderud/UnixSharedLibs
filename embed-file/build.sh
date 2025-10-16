echo Cleaning up...
rm -f *.o mainApp

# convert embed_example.txt into an object file to binary embedding
ld -r -b binary -o embed_example.o embed_example.txt

echo Building mainApp...
g++ main.cpp embed_example.o -o mainApp

echo ""
echo Running mainApp:
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
