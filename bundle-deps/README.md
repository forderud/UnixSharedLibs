Attempt on bundling new C/C++ libs with a shared library to allow it to run on older Linux distros.

Quote from: [Option Soup: the subtle pitfalls of combining compiler flags](https://hacks.mozilla.org/2024/01/option-soup-the-subtle-pitfalls-of-combining-compiler-flags/): "There are other ways to use a different libstdc++ than available on the system, such as using dynamic linking and setting an `RPATH` to link with a bundled version."

### Problem observed when trying use bundled C/C++ libs
```
libc.so.6 dependencies:
/bin/bash: relocation error: /host/bundle-deps/libc.so.6: symbol _dl_audit_symbind_alt version GLIBC_PRIVATE not defined in file ld-linux-x86-64.so.2 with link time reference
```

### Dependencies on Ubuntu 24:04
```
Transitive shared lib. dependencies:
        linux-vdso.so.1 (0x00007ffc5f73e000)
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
