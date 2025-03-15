Experiements for force-linking (and loading) of shared libraries on Linux and similar operating systems.

**PROBLEM**: How to configure building of a shared library (`.so`) to automatically load a dependent shared library despite it _not_ having any direct symbol dependencies?

**BACKGROUND**: Want to force-load an unreferenced transitive dependency that performs important tasks during initialization of its global variables. This doesn't work out-of-the-box, since the linker eliminates unreferenced depdendencies.

WARNING: Doesn't work yet!
