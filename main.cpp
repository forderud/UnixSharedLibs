#include <iostream>
int mylibFunction(); // forward decl

int main() {
  int val = mylibFunction();
  printf("Returned %i\n", val);
  return 0;
}

