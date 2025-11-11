#include <cstdint>
#include <stdio.h>
#include <cassert>
#include <pthread.h>
#include "sharedlib.hpp"

static void* thread_function(void*) {
    printf("Hello from thread!\n");
    return NULL;
}

int main () {
    printf("executable built against glibc %d.%d\n", __GLIBC__, __GLIBC_MINOR__);
    printf("mysharedlib built against libstdc++ %d\n", __GLIBCXX__); // was __GLIBCPP__ before 3.4.0

    printf("Calling compute_sum...\n");
    int sum = compute_sum(3, 4);
    printf("Returned %i\n", sum);

    pthread_t thread = {};
    pthread_create(&thread, NULL, thread_function, NULL);
    pthread_join(thread, NULL);

    return 0;
}
