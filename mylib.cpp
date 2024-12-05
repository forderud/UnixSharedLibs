#include <iostream>


void InitializationTask() {
    printf("Library loading.\n");
    return 42;
}

__attribute__((used))
int g_forceLink = InitializationTask();


int mylibFunction() {
  printf("Hello world\n");
  return 42;
}

