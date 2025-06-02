#include <cassert>
#include <cstdint>
#include <stdio.h>
#include <string>
#include "mystaticlib.hpp"


int compute_sum_static (int a, int b) {
    printf("Computing the sum of %i and %i ...\n", a, b);
    int sum = a + b;
    printf("The sum is %i\n", sum);
    return sum;
}
