#include <cstdint>
#include <fstream>
#include <stdio.h>
#include <string>
#include <vector>
#include "mylib.h"


int compute_sum (int a, int b) {
    printf("mylib built against glibc %d.%d\n", __GLIBC__, __GLIBC_MINOR__);

    {
        printf("Testing dynamic memory allocation...\n");
        std::vector<uint8_t> buffer(1024*1014, (uint8_t)0);
        printf("[success]\n\n");
    }
    {
        printf("Testing file I/O...\n");
        std::ifstream file("document.txt");
        std::string line;
        while (std::getline(file, line))
            printf("file content: %s\n", line.c_str());
        printf("[success]\n\n");
    }

    printf("Computing the sum of %i and %i ...\n", a, b);
    int sum = a + b;
    printf("The sum is %i\n", sum);
    return sum;
}
