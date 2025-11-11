Test code for different approaches for building **shared libraries** that are **compatible with older glibc and libstdc++ versions** than the version used to compile the library.

### Alternative 1: Build on oldest supported system

|   | Build on oldest supported system |
|---|----------------------------------|
| Benefit | Simple. No custom build settings required. |
| Drawback | Outdated build environment. Becomes increasingly difficult to adopt compiler and 3rd party library updates over time. |


### Alternative 2: Bundle libstdc++
Quote from: [Option Soup: the subtle pitfalls of combining compiler flags](https://hacks.mozilla.org/2024/01/option-soup-the-subtle-pitfalls-of-combining-compiler-flags/): "There are other ways to use a different libstdc++ than available on the system, such as using dynamic linking and setting an `RPATH` to link with a bundled version."

|   | Bundle libstdc++ and `RPATH` |
|---|------------------------------|
| Benefit | Avoid compatibility problems by making the binary distribution self-contained. |
| Drawback | Adopters might not be interested in setting `RPATH` to use the custom libstdc++ library together with the rest of their codebase. |


### Alternative 3: Install old glibc on build system

Article: [How to Install and Run Multiple glibc Libraries in Linux](https://www.tecmint.com/install-multiple-glibc-libraries-linux/) explains how to build & install an old glibc version. Then, `export LD_LIBRARY_PATH=/opt/glibc-<version>/lib:$LD_LIBRARY_PATH` to explicitly build against the old glibc version.

|   | Install old glibc on build system |
|---|-----------------------------------|
| Benefit | Mostly modern build system, except for old glibc. |
| Drawback | TBD. |


### Alternative 4: Static linking to libgcc/musl & libstdc++
The `-static-libgcc` and `-static-libstdc++` linker flags are used to link to the static version of these dependent libraries. This eliminates run-time depdendencies to `libgcc_s.so` and `libstdc++.so`.

NOTE: Fedora/RedHat systems will need to install the [`libstdc++-static`](https://packages.fedoraproject.org/pkgs/gcc/libstdc++-static/) package.

|  | Static linking to libgcc/musl & libstdc++ |
|--|-------------------------------------------|
| Benefit | Avoid compatibility problems by making the binaries self-contained. |
| Drawback | * More difficult to configure build settings.
             * Might also require switching from glibc to the [musl](https://musl.libc.org/) C library. |


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

#### Bundled C/C++ library versions
| Distro       | Glibc | libstdc++ |
|--------------|-------|-----------|
| Ubuntu 18.04 | 2.27  | 20191114  |
| Ubuntu 24.04 | 2.39  | 20240904  |

#### Links
* glibc releases: https://sourceware.org/glibc/wiki/Glibc%20Timeline
* Glibc readme: https://github.com/bminor/glibc/blob/master/README (glibc 2.39 require Linux 3.2 or newer)

## Code samples
### Apitrace example
* [CMakeLists.txt](https://github.com/apitrace/apitrace/blob/master/wrappers/CMakeLists.txt) - defines `-static-libgcc` `-static-libstdc++`, `--version-script` and `-Wl,-Bsymbolic -Wl,-Bsymbolic-functions`
* [glxtrace.version](https://github.com/apitrace/apitrace/blob/master/wrappers/glxtrace.version) - lists functions to export

### Mesa3D example
* Mesa3D [gallium.py](https://github.com/notaz/mesa/blob/master/scons/gallium.py#L590) - defines `-static-libgcc`, `-static-libstdc++` (for windows builds), `-Wl,-Bsymbolic` and more
* Mesa3D [opencl/Makefile.am](https://github.com/notaz/mesa/blob/master/src/gallium/targets/opencl/Makefile.am) - passes `--version-script=opencl.sym`
* Mesa3D [opencl/opencl.sym](https://github.com/notaz/mesa/blob/master/src/gallium/targets/opencl/opencl.sym) - lists functions to export
