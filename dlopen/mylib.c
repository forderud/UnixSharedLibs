#include <stdio.h>
#include "mylib.h"


int compute_sum (int a, int b) {
    prinf("Computing the sum of %i and %i ...\n");
    int sum = a + b;
    prinf("The sum is %i\n", sum);
    return sum;
}
