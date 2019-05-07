function(create_test_executable)
    set(options)
    set(oneValueArgs SOURCE)
    set(multiValueArgs LABELS)
    cmake_parse_arguments(ARG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    
    string(REPLACE ".cc" "" filename_without_suffix ${ARG_SOURCE})
    set(test_name "test_${filename_without_suffix}")
    add_executable(${test_name} ${ARG_SOURCE})
    target_link_libraries(${test_name} dotprod)

    # link with googletest library
    target_link_libraries(${test_name} gtest_main)
    
    add_test(NAME ${filename_without_suffix} COMMAND ${test_name})
    set_tests_properties( ${filename_without_suffix} PROPERTIES LABELS "${ARG_LABELS}")
endfunction()

include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        release-1.8.1
)
FetchContent_MakeAvailable(googletest)

set(unit_tests norm.cc orthogonal.cc)
foreach(src IN LISTS unit_tests)
    create_test_executable(SOURCE ${src} LABELS "unit_tests")
endforeach()

set(regression_tests large_vector.cc)
foreach(src IN LISTS regression_tests)
    create_test_executable(SOURCE ${src} LABELS "regression_tests")
endforeach()
