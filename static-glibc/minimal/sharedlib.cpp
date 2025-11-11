#include <stdio.h>
#include "sharedlib.hpp"


int compute_sum (int a, int b) {
    printf("sharedlib built against glibc %d.%d\n", __GLIBC__, __GLIBC_MINOR__);

    int sum = a + b;
    printf("sharedlib returned %i\n", sum);
    return sum;
}
