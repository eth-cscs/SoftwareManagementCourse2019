# Part 1) Use Modern CMake

The CMakeLists.txt for dotprodcl is currently written in old-style CMake. Update the project to Modern CMake.


# Part 2) FindDotprod.cmake

The dotprodcl application currently uses variables to point to its dependency, the dotprod library.
Additionally it explicitly sets include path and the library name.

### a) Write a minimal FindDotprod.cmake

Start from the skeleton in cmake/FindDotprod.cmake.
Use "imported targets" to propagate needed information to the application
(include path, library). This is a strategy which you would apply if you don't want to modify the build
infrastructure of the library (see next session for a proper solution in this case)

### b) Write a clean FindDotprod.cmake (optional)

The skeleton which you filled in a) doesn't follow all best practices.
Improve it, by following the [guide for CMake module developers](https://cmake.org/cmake/help/latest/manual/cmake-developer.7.html).
- use find\_package\_handle\_standard\_args()
- add protection for including the file more than once
- use mark\_as\_advanced() where appropriate
- what would you have to do to make it pkg-config compatible
