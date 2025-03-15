#include <cstdint>
#include <stdio.h>
#include <vector>
#include "mylib.h"


int compute_sum (int a, int b) {
    printf("mylib built against glibc %d.%d\n", __GLIBC__, __GLIBC_MINOR__);

    printf("Performing dynamic memory allocation...\n");
    std::vector<uint8_t> buffer(1024*1014, (uint8_t)0);

    printf("Computing the sum of %i and %i ...\n", a, b);
    int sum = a + b;
    printf("The sum is %i\n", sum);
    return sum;
}
