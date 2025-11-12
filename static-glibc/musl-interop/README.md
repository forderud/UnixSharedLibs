Test for calling a shared lib (`.so`) using the "musl" C library from a executable using the "glibc" C library.


## Musl binaries on Ubuntu
```
# ls -al /usr/bin/*musl*
-rwxr-xr-x 1 root root 440 Nov  9  2023 ld-musl-config
lrwxrwxrwx 1 root root  21 Nov 10  2023 musl-gcc -> x86_64-linux-musl-gcc
lrwxrwxrwx 1 root root  30 Nov 10  2023 musl-ldd -> /lib/x86_64-linux-musl/libc.so
-rwxr-xr-x 1 root root 106 Nov 10  2023 x86_64-linux-musl-gcc
```

```
#ls -al /lib/x86_64-linux-musl
total 3344
drwxr-xr-x 2 root root    4096 Nov 11 17:39 .
drwxr-xr-x 1 root root    4096 Nov 11 17:39 ..
-rw-r--r-- 1 root root    5384 Nov 10  2023 Scrt1.o
-rw-r--r-- 1 root root    5376 Nov 10  2023 crt1.o
-rw-r--r-- 1 root root    2632 Nov 10  2023 crti.o
-rw-r--r-- 1 root root    2576 Nov 10  2023 crtn.o
-rw-r--r-- 1 root root 2604238 Nov 10  2023 libc.a
-rwxr-xr-x 1 root root  731616 Nov 10  2023 libc.so
-rw-r--r-- 1 root root       8 Nov 10  2023 libdl.a
-rw-r--r-- 1 root root       8 Nov 10  2023 libm.a
-rw-r--r-- 1 root root       8 Nov 10  2023 libpthread.a
-rw-r--r-- 1 root root       8 Nov 10  2023 libresolv.a
-rw-r--r-- 1 root root       8 Nov 10  2023 librt.a
-rw-r--r-- 1 root root       8 Nov 10  2023 libutil.a
-rw-r--r-- 1 root root       8 Nov 10  2023 libxnet.a
-rw-r--r-- 1 root root     757 Nov 10  2023 musl-gcc.specs
-rw-r--r-- 1 root root   12696 Nov 10  2023 rcrt1.o
```


## Links
* [Load both musl libc.so and gcc libc.so in the same process?](https://stackoverflow.com/questions/30151808/load-both-musl-libc-so-and-gcc-libc-so-in-the-same-process): Claims that it's not supported. Still, this sample proves that it can work.
