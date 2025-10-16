echo Cleaning up...
rm -f *.o mainApp

# convert embed_example.txt into an object file to binary embedding
echo Building mainApp...
g++ main.cpp -r -sectcreate __TEXT embed_example embed_example.txt -o mainApp

echo ""
echo Running mainApp:
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
