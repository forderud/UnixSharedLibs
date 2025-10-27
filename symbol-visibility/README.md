Experiments with static linking of the C++ standard library and other dependencies in Linux shared libraries.

**PROBLEM**: How to encapsulate C++ usage in a shared library (`.so`) with a "C" API without exposing any C++ symbols to the client?

**BACKGROUND**: Want to minimize the run-time dependencies for a shared library to reduce risk of compatibility problems.

## Documentation
* GCC [Symbol Visibility](https://gcc.gnu.org/wiki/Visibility) - covers `-fvisibility=hidden` and `-fvisibility-inlines-hidden`
* `-static-libgcc` `-static-libstdc++`
