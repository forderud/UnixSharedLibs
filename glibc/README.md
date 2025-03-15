Test code for loading an "new" shared library on an "old" system with older glibc than the version used to compile the library.

The `glibc-2.39` folder contains a precompiled version of "mylib" build with Ubuntu 24.4 (glibc 2.39).

## Test output
Experiment conducted on Ubuntu 14.4 (glibc 2.19):
* Copy `mylib.o` and `libmylib.so` from glibc-2.39 subfolder to this folder.
* Disable "mylib" building step in `build.sh`
* Run `build.sh` to build and run the test application.
* Observed output:
```
$ ./build.sh
Running mainApp:
executable built against glibc 2.19
mylib built against glibc 2.39
Computing the sum of 3 and 4 ...
The sum is 7
Return-value 7
``` 

This demonstrates that a "new" shared library compiled against glibc 2.39 can run on an older system with glibc 2.19. The test succeeds both with implicit (using `-lmylib`) and explicit (define `DUSE_DLOPEN` to switch to `dlopen`) loading of `libmylib.so`, which was a positive surprise.


## Generic
* [Linux binary compatibility explained at 5 levels of difficulty](https://ruvi-d.medium.com/linux-binary-compatibility-explained-at-5-levels-of-difficulty-ffeab6235fc8)

## Ubuntu
* [glibc package in Ubuntu](https://launchpad.net/ubuntu/+source/glibc): glibc 2.23 in Xenial Xerus (16.04.7 LTS)

## RedHat Enterprise Linux (RHEL)
* DistroWatch: https://distrowatch.com/table.php?distribution=redhat (glibc 2.28 since RHEL 8.10 and glibc 2.17 since RHEL 7.9)

## glibc links
* glibc releases: https://sourceware.org/glibc/wiki/Glibc%20Timeline
* Linux 3.2 or newer required: https://github.com/bminor/glibc/blob/master/README
* Linux version check: https://github.com/bminor/glibc/blob/master/sysdeps/unix/sysv/linux/configure#L20
