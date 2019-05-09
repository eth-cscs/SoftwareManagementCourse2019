# Part 1) Use fetch_content() to link to a third party library

The dotprod library was extended and now uses googletest for testing.
Currently an old googletest version is used, which is part of the repository (in external). Update to the most recent version of googletest
(v1.8.1, https://github.com/google/googletest).
- Use fetch_content() instead of making googletest part of your repository.
- Link with the gtest targets which makes transitive dependencies (pthread) unneeded.

# Part 2) Exporting targets

- Properly export the target for the dotprod library and install it together with the library (add a version number to the library)
- Update dotprodcl to use the exported target.
- Try that the version matching works by setting to an incompatible version in find_package().
