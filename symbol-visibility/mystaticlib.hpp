#pragma once

extern "C" // to avoid name mangling
int compute_sum_static (int a, int b);

extern "C" // to avoid name mangling
void throw_standard_exception (const char* message);

extern "C" // to avoid name mangling
void throw_custom_exception (const char* message);
