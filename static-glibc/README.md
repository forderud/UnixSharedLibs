Test for **loading a new shared library on a system with older glibc version** than the version used to compile the library.

The `glibc-2.40` subfolder contains a precompiled version of "mylib" built with [Fedora 41](https://fedoraproject.org/) (Linux 6.11, glibc 2.40) to simplify testing.

## Static linking to libgcc & libstdc++
The `-static-libgcc` and `-static-libstdc++` linker flags are used to link to the static version of these dependent libraries. This eliminates run-time depdendencies to `libgcc_s.so` and `libstdc++.so`.

You might need to install the `libstdc++-static` SW package in order to make the build succeed.

## Experiment
Experiment conducted on [Ubuntu 14.4](https://releases.ubuntu.com/14.04/) (Linux 4.4, glibc 2.19):
* Copy `mylib.o` and `libmylib.so` from glibc-2.40 subfolder to this folder.
* Disable "mylib" building step in `build.sh` so that the precompiled version is used.
* Run `build.sh` to build and run the test application.
* Observed output:
```
$ ./build.sh
./libmylib.so: undefined reference to `__isoc23_strtoul@GLIBC_2.38'
./libmylib.so: undefined reference to `fstat@GLIBC_2.33'
./libmylib.so: undefined reference to `getentropy@GLIBC_2.25'
./libmylib.so: undefined reference to `arc4random@GLIBC_2.36'
./libmylib.so: undefined reference to `pthread_once@GLIBC_2.34'
./libmylib.so: undefined reference to `_dl_find_object@GLIBC_2.35'
./libmylib.so: undefined reference to `__libc_single_threaded@GLIBC_2.32'
``` 

~~This demonstrates that **a "new" shared library compiled against glibc 2.39 can run out of the box on an older system with glibc 2.19**. The test succeeds both with implicit (`-lmylib`) and explicit (`dlopen("libmylib.so")`) loading of `libmylib.so`, which was a positive surprise.~~

There might be limitations though that are not yet understood. Still, I would assume that any problems would be easily discoverable, since missing dependencies typically lead to run-time crashes at _startup_, and not problems or crashes later during execution. A simple startup test should therefore suffice to assess compatibility with a given Linux distro release.

## External resources
* [Linux binary compatibility explained at 5 levels of difficulty](https://ruvi-d.medium.com/linux-binary-compatibility-explained-at-5-levels-of-difficulty-ffeab6235fc8)

### Ubuntu
* [glibc package in Ubuntu](https://launchpad.net/ubuntu/+source/glibc): glibc 2.23 in Xenial Xerus (16.04.7 LTS)

### RedHat Enterprise Linux (RHEL)
* DistroWatch: https://distrowatch.com/table.php?distribution=redhat (glibc 2.28 since RHEL 8.10 and glibc 2.17 since RHEL 7.9)

### glibc
* glibc releases: https://sourceware.org/glibc/wiki/Glibc%20Timeline
* Glibc readme: https://github.com/bminor/glibc/blob/master/README (glibc 2.39 require Linux 3.2 or newer)

### Example projects
* Mesa3D [gallium.py](https://github.com/notaz/mesa/blob/master/scons/gallium.py#L590) - defines `-static-libgcc`, `-static-libstdc++` (and more) for windows builds