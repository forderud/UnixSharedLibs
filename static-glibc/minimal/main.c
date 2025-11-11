#include <stdio.h>
#include <assert.h>
#include <pthread.h>


static void* thread_function(void *arg) {
    printf("Hello from thread!\n");
    return NULL;
}

int main () {
    printf("executable built against glibc %d.%d\n", __GLIBC__, __GLIBC_MINOR__);

    size_t job = 0;
    pthread_t thread = {};
    pthread_create(&thread, NULL, thread_function, &job);
    pthread_join(thread, NULL);

    return 0;
}
