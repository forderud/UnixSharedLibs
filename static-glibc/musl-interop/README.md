Test for calling a shared lib (`.so`) using the "musl" C library from a executable using the "glibc" C library.

#### Observed behavior
```
./mainApp: error while loading shared libraries: /lib/x86_64-linux-gnu/libc.so: invalid ELF header
```
