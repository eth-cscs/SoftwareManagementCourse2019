# Part 1) Use Modern CMake

The CMakeLists.txt for dotprodcl is currently written in old-style CMake. Update the project to Modern CMake.


# Part 2)

The dotprodcl application currently uses variables to point to its dependency, the dotprod library.
Additionally it explicitly sets include path and the library name.

### a) Write a minimal FindDotprod.cmake

Use "imported targets" to propagate needed information to the application
(include path, library). This is a strategy which you would apply if you don't want to modify the build
infrastructure of the library (see next session for a proper solution in this case)).

### b) Write a clean FindDotprod.cmake (optional)

The skeleton which you filled in a) doesn't follow all best practices.
Improve it, following the requirements described in TODO and using helpers
- add protection for including the file more than once
- proper handling of error messages
- use find_package_handle_standard_args
- make it pkg-config compatible
- TODO
