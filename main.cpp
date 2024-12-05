#include <iostream>
int mylibFunction(); // forward decl

int main() {
#ifdef CALL_SHARED_LIB
  int val = mylibFunction();
  printf("Returned %i\n", val);
#endif
  return 0;
}

