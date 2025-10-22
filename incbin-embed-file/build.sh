echo Cleaning up...
rm -f *.o mainApp


echo Building mainApp...
g++ main.cpp -o mainApp

echo ""
echo Running mainApp:
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./mainApp
