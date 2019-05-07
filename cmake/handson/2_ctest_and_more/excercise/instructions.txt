Part 1)

Add CTest functionality to the dotprod library. Use the `BUILD_TESTING` variable to enable/disable building of the tests.
- Verify that `make test` executes the tests.
A new test `large_vector.cc` was added.
- Add an option to run the tests without this expensive regression test by using ctest labels. 
