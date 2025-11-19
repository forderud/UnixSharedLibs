Attempt on bundling new C/C++ libs with a shared library to allow it to run on older Linux distros.

Quote from: [Option Soup: the subtle pitfalls of combining compiler flags](https://hacks.mozilla.org/2024/01/option-soup-the-subtle-pitfalls-of-combining-compiler-flags/): "There are other ways to use a different libstdc++ than available on the system, such as using dynamic linking and setting an `RPATH` to link with a bundled version."

### Problem observed when trying use bundled C/C++ libs
```
./libmysharedlib.so: undefined reference to `std::__exception_ptr::exception_ptr::_M_release()@CXXABI_1.3.13'
./libmysharedlib.so: undefined reference to `std::__exception_ptr::exception_ptr::_M_addref()@CXXABI_1.3.13'
./libmysharedlib.so: undefined reference to `std::__throw_bad_array_new_length()@GLIBCXX_3.4.29'
collect2: error: ld returned 1 exit status
```

### Ubuntu 24:04 dependency tree
```
Transitive shared lib. dependencies:
        linux-vdso.so.1
        libstdc++.so.6 => /host/bundle-deps/libstdc++.so.6
        libgcc_s.so.1 => /host/bundle-deps/libgcc_s.so.1
        libc.so.6 => /host/bundle-deps/libc.so.6
        /lib64/ld-linux-x86-64.so.2
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6

libstdc++.so.6 dependencies:
        linux-vdso.so.1
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6
        libc.so.6 => /host/bundle-deps/libc.so.6
        /lib64/ld-linux-x86-64.so.2
        libgcc_s.so.1 => /host/bundle-deps/libgcc_s.so.1

libgcc_s.so.1 dependencies:
        linux-vdso.so.1
        libc.so.6 => /host/bundle-deps/libc.so.6
        /lib64/ld-linux-x86-64.so.2

libc.so.6 dependencies:
        /lib64/ld-linux-x86-64.so.2
        linux-vdso.so.1

ld-linux-x86-64.so.2 dependencies:
        statically linked
```

## Links
* [Multiple glibc libraries on a single host](https://stackoverflow.com/questions/847179/multiple-glibc-libraries-on-a-single-host) - mentions `-Wl,--rpath`/`-Wl,--dynamic-linker` and `LD_LIBRARY_PATH`/`LD_PRELOAD`
* GNU binutils [LD](https://sourceware.org/binutils/docs/ld.html) doc - covers `-rpath`/`LD_RUN_PATH`
* GCC C++ [ABI Policy and Guidelines](https://gcc.gnu.org/onlinedocs/libstdc++/manual/abi.html)
* GCC [3.5 Options Controlling C++ Dialect](https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Dialect-Options.html) - covers `-fabi-version=n` and `-fabi-compat-version=n`
