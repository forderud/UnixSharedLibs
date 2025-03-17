#include <cassert>
#include <cstdint>
#include <string>
#include <vector>
#include "mysharedlib.hpp"
#include "mystaticlib.hpp"


int compute_sum (int a, int b) {
    printf("mysharedlib built against glibc %d.%d\n", __GLIBC__, __GLIBC_MINOR__);

    {
        printf("Testing dynamic memory allocation...\n");
        std::vector<uint8_t> buffer(1024*1014, (uint8_t)0);
        assert(buffer[1024] == 0);
        printf("[success]\n\n");
    }

    printf("Forwarding computation request to mystaticlib...\n");
    int sum = compute_sum_static(a, b);
    printf("mystaticlib returned %i\n", sum);
    return sum;
}
