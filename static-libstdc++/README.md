Reproducer for problem with `-static-libstdc++` in shared libraries

**GOAL**: Develop a Linux shared library (.so) with as few run-time dependencies as possible, so that it becomes compatible with multiple distros of various age.

**PROBLEM**: Observing segfault if combining `-static-libstdc++` with `-Wl,--exclude-libs,ALL` in shared library. Unsure if this is due to a bug or inherent limitation in libstdc++.

## External resources
Documentation:
* GCC [Options for Linking](https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html) - documents `-static-libstdc++`
* GNU binutils [LD](https://sourceware.org/binutils/docs/ld.html) - documents `--exclude-libs`
