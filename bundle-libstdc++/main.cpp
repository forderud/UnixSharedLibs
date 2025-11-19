#include <stdio.h>
#include <assert.h>
#include <cstdint>
#include "mysharedlib.hpp"

int main () {
    printf("executable built against glibc %d.%d\n", __GLIBC__, __GLIBC_MINOR__);
    printf("executable built against libstdc++ %d\n", _GLIBCXX_RELEASE);
	printf("executable C++ ABI %u\n", __GXX_ABI_VERSION);

    int sum = compute_sum(3, 4);
    printf("Return-value %i\n", sum);

    return 0;
}
