Experiements for force-linking (and loading) of shared libraries on Linux and similar operating systems.

**PROBLEM**: How to force-link to a shared library (`.so`), so that it's loaded at run-time despite _not_ having any symbol dependencies?

**BACKGROUND**: Want to force-load an unreferenced library that performs important tasks during initialization of its global variables. This doesn't work out-of-the-box, since the linker will eliminate unreferenced depdendencies. The solution needs to be compatible with Linux, Android and macOS.

WARNING: Doesn't work yet!
