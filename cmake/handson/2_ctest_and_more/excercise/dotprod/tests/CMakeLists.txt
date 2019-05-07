function(create_test_executable)
    set(options)
    set(oneValueArgs SOURCE)
    set(multiValueArgs)
    cmake_parse_arguments(ARG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    
    string(REPLACE ".cc" "" filename_without_suffix ${ARG_SOURCE})
    set(test_name "test_${filename_without_suffix}")
    add_executable(${test_name} ${ARG_SOURCE})
    target_link_libraries(${test_name} dotprod)

    # link with googletest library
    target_link_libraries(${test_name} gtest_main)
endfunction()

include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        release-1.8.1
)
FetchContent_MakeAvailable(googletest)

set(test_sources norm.cc orthogonal.cc large_vector.cc)

foreach(src IN LISTS test_sources)
    create_test_executable(SOURCE ${src})
endforeach()
