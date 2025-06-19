#pragma once

extern "C" // to avoid name mangling
int compute_sum_static (int a, int b);

extern "C" // to avoid name mangling
void throw_exception_static (const char* message);
