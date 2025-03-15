Test for loading an "new" shared library on an "old" system with older glibc than the version used to compile the library.

The `glibc-2.39` subfolder contains a precompiled version of "mylib" built with [Ubuntu 24.4](https://releases.ubuntu.com/24.04/) (linux 6.11, glibc 2.39) to simplify testing.

## Experiment
Experiment conducted on [Ubuntu 14.4](https://releases.ubuntu.com/14.04/) (linux 4.4, glibc 2.19):
* Copy `mylib.o` and `libmylib.so` from glibc-2.39 subfolder to this folder.
* Disable "mylib" building step in `build.sh` so that the precompiled version is used.
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

This demonstrates that **a "new" shared library compiled against glibc 2.39 can run out of the box on an older system with glibc 2.19**. The test succeeds both with implicit (`-lmylib`) and explicit (`USE_DLOPEN` to switch to `dlopen`) loading of `libmylib.so`, which was a positive surprise.

There might be limitations though that are not yet understood. Still, I would assume that any problems would be easily disoverable, since missing dependencies typically lead to run-time crashes at _startup_, and not subtle problems or crashes later during execution. A simple startup test should therefore suffice to assess compatibility with a given linux distro release.

## External resources
* [Linux binary compatibility explained at 5 levels of difficulty](https://ruvi-d.medium.com/linux-binary-compatibility-explained-at-5-levels-of-difficulty-ffeab6235fc8)

### Ubuntu
* [glibc package in Ubuntu](https://launchpad.net/ubuntu/+source/glibc): glibc 2.23 in Xenial Xerus (16.04.7 LTS)

### RedHat Enterprise Linux (RHEL)
* DistroWatch: https://distrowatch.com/table.php?distribution=redhat (glibc 2.28 since RHEL 8.10 and glibc 2.17 since RHEL 7.9)

### glibc
* glibc releases: https://sourceware.org/glibc/wiki/Glibc%20Timeline
* Glibc readme: https://github.com/bminor/glibc/blob/master/README (glibc 2.39 require Linux 3.2 or newer)
