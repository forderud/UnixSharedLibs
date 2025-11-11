Test for **loading a new shared library on a system with older glibc version** than the version used to compile the library.

## Static linking to libgcc & libstdc++
The `-static-libgcc` and `-static-libstdc++` linker flags are used to link to the static version of these dependent libraries. This eliminates run-time depdendencies to `libgcc_s.so` and `libstdc++.so`.

You might need to install the `libstdc++-static` SW package in order to make the build succeed.

## External resources
Documentation:
* GCC [Options for Linking](https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html) - covers `-static-libgcc` and `-static-libstdc++`
* GNU binutils [LD](https://sourceware.org/binutils/docs/ld.html) doc - covers `-Bsymbolic` and `-Bsymbolic-functions`

Articles:
* [Statically linking libstdc++](https://codearcana.com/posts/2015/12/09/statically-linking-libstdc.html) - also mentions `-Bsymbolic-functions`
* [Linux binary compatibility explained at 5 levels of difficulty](https://ruvi-d.medium.com/linux-binary-compatibility-explained-at-5-levels-of-difficulty-ffeab6235fc8)
* [glibc package in Ubuntu](https://launchpad.net/ubuntu/+source/glibc): glibc 2.23 in Xenial Xerus (16.04.7 LTS)
* DistroWatch: https://distrowatch.com/table.php?distribution=redhat (glibc 2.28 since RHEL 8.10 and glibc 2.17 since RHEL 7.9)

### glibc
* glibc releases: https://sourceware.org/glibc/wiki/Glibc%20Timeline
* Glibc readme: https://github.com/bminor/glibc/blob/master/README (glibc 2.39 require Linux 3.2 or newer)

## Alternative: Bundle libstdc++ and RPATH
Quote from: [Option Soup: the subtle pitfalls of combining compiler flags](https://hacks.mozilla.org/2024/01/option-soup-the-subtle-pitfalls-of-combining-compiler-flags/): "There are other ways to use a different libstdc++ than available on the system, such as using dynamic linking and setting an `RPATH` to link with a bundled version."

## Code samples
### Apitrace example
* [CMakeLists.txt](https://github.com/apitrace/apitrace/blob/master/wrappers/CMakeLists.txt) - defines `-static-libgcc` `-static-libstdc++`, `--version-script` and `-Wl,-Bsymbolic -Wl,-Bsymbolic-functions`
* [glxtrace.version](https://github.com/apitrace/apitrace/blob/master/wrappers/glxtrace.version) - lists functions to export

### Mesa3D example
* Mesa3D [gallium.py](https://github.com/notaz/mesa/blob/master/scons/gallium.py#L590) - defines `-static-libgcc`, `-static-libstdc++` (for windows builds), `-Wl,-Bsymbolic` and more
* Mesa3D [opencl/Makefile.am](https://github.com/notaz/mesa/blob/master/src/gallium/targets/opencl/Makefile.am) - passes `--version-script=opencl.sym`
* Mesa3D [opencl/opencl.sym](https://github.com/notaz/mesa/blob/master/src/gallium/targets/opencl/opencl.sym) - lists functions to export
