#include <stdio.h>
#include <assert.h>

#ifdef USE_DLOPEN
  #include <dlfcn.h>
#else
  #include "mylib.h"
#endif

typedef int (*add_function_t)(int a ,int b);

int main () {
    printf("executable built against glibc %d.%d\n", __GLIBC__, __GLIBC_MINOR__);
    
    add_function_t add_function = NULL;
#ifdef USE_DLOPEN
    void* module = dlopen("libmysharedlib.so", RTLD_LAZY);
    assert(module);
    add_function = (add_function_t)dlsym(module, "compute_sum");
    assert(add_function);
#else
    add_function = compute_sum;
#endif

    int sum = add_function(3, 4);
    printf("Return-value %i\n", sum);

    return 0;
}
