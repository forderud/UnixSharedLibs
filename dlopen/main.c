#include <stdio.h>

#ifdef USE_DLOPEN
  #include <dlfcn.h>
#else
  #include "mylib.h"
#endif

int main () {
    printf("executable built against glibc %d.%d\n", __GLIBC__, __GLIBC_MINOR__);
    
    typedef int (*add_function_t)(int a ,int b);

    add_function_t add_function = nullptr;
#ifdef USE_DLOPEN
    void* module = dlopen("mylib.so", RTLD_LAZY);
    add_function = (add_function_t)dlsym(module, "compute_sum");
#else
    add_function = compute_sum;
#endif

    int sum = add_function(3, 4);
    printf("Return-value %i\n", sum);

    return 0;
}
