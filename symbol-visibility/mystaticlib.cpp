#include <cassert>
#include <cstdint>
#include <stdio.h>
#include <string>
#include <stdexcept>
#include "mystaticlib.hpp"


int compute_sum_static (int a, int b) {
    printf("Computing the sum of %i and %i ...\n", a, b);
    int sum = a + b;
    printf("The sum is %i\n", sum);
    return sum;
}

void throw_standard_exception (const char* message) {
    throw std::runtime_error(message);
}


class MyCustomException : public std::exception {
public:
    MyCustomException(const char* message) : message(message) {
    }
    
    const char* what() const noexcept override {
        return message.c_str();
    }
    
private:
    std::string message;
    
};

void throw_custom_exception (const char* message) {
    throw MyCustomException("MyCustomException problem");
}
