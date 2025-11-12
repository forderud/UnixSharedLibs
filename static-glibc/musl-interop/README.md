Test for calling a shared lib (`.so`) using the "musl" C library from a executable using the "glibc" C library.

#### Observed behavior
```
./mainApp: error while loading shared libraries: /lib/x86_64-linux-gnu/libc.so: invalid ELF header
```


## Musl binaries on Ubuntu
```
# ls -al /usr/bin/*musl*
-rwxr-xr-x 1 root root 440 Nov  9  2023 ld-musl-config
lrwxrwxrwx 1 root root  21 Nov 10  2023 musl-gcc -> x86_64-linux-musl-gcc
lrwxrwxrwx 1 root root  30 Nov 10  2023 musl-ldd -> /lib/x86_64-linux-musl/libc.so
-rwxr-xr-x 1 root root 106 Nov 10  2023 x86_64-linux-musl-gcc
```
