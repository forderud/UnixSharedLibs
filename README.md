### C/C++ libraries bundled with Linux distros

| Distro       | Support Life    | Linux kernel | Glibc | GCC/libstdc++ |
|--------------|-----------------|--------------|-------|---------------|
| Ubuntu 18.04 |Apr '18 - Apr '28| 4.15         | 2.27  | 7             |
| Ubuntu 24.04 |Apr '24 - Apr '34| 6.8          | 2.39  | 13            |
| Fedora 43    |Oct '25 - Dec '26| 6.17         | 2.42  | 15            |

Kernel versions taken from Wikipedia [Ubuntu version history](https://en.wikipedia.org/wiki/Ubuntu_version_history#Table_of_versions) and [Fedora Linux release history](https://en.wikipedia.org/wiki/Fedora_Linux_release_history).

### Links
* glibc releases: https://sourceware.org/glibc/wiki/Glibc%20Timeline
* Glibc readme: https://github.com/bminor/glibc/blob/master/README (glibc 2.24-2.42 require Linux 3.2 or newer)
* [GCC Releases](https://gcc.gnu.org/releases.html) with dates
* GNU C++ Library Manual: [Chapter 2. Setup](https://github.com/gcc-mirror/gcc/blob/master/libstdc%2B%2B-v3/doc/html/manual/setup.html) - glibc 2.3 or later is required for GCC >=4.6.

#### Distro packages
* Ubuntu [`glibc` package](https://launchpad.net/ubuntu/+source/glibc): Glibc 2.23 in Xenial Xerus (16.04.7 LTS)
* Fedora [`glibc` package](https://packages.fedoraproject.org/pkgs/glibc/glibc/)
* DistroWatch: https://distrowatch.com/table.php?distribution=redhat (glibc 2.28 since RHEL 8.10 and glibc 2.17 since RHEL 7.9)
