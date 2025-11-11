#include <stdio.h>
#include <assert.h>


int main () {
    printf("executable built against glibc %d.%d\n", __GLIBC__, __GLIBC_MINOR__);
    return 0;
}
