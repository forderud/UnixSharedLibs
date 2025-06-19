Experiements static linking of the C++ standard library and other dependencies in shared libraries on Linux.

**PROBLEM**: How to encapsulate C++ usage in a shared library (`.so`) with a "C" API without exposing any C++ symbols to the client?

**BACKGROUND**: Want to minimize the run-time dependencies for a shared library to reduce risk of compatibility problems.
