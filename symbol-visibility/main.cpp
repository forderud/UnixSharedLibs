#include <stdio.h>
#include <assert.h>
#include "mysharedlib.hpp"


int main () {
    int sum = compute_sum(3, 4);
    printf("Return-value %i\n", sum);

    return 0;
}
