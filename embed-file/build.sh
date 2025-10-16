echo Cleaning up...
rm -f *.o mainApp

# convert example.txt into an object file to binary embedding
ld -r -b binary -o example.o example.txt

echo Building mainApp...
g++ main.cpp example.o -o mainApp

echo ""
echo Running mainApp:
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp

