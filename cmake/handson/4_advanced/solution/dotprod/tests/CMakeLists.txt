function(create_test_executables)
    set(options)
    set(oneValueArgs)
    set(multiValueArgs SOURCES LABELS)
    cmake_parse_arguments(ARG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    
    foreach(src IN LISTS ARG_SOURCES)
        get_filename_component(filename_without_suffix ${src} NAME_WE)
        set(test_name "test_${filename_without_suffix}")
        add_executable(${test_name} ${src})
        target_link_libraries(${test_name} dotprod)
        
        # link with googletest library
        target_link_libraries(${test_name} gtest_main)
        
        add_test(NAME ${filename_without_suffix} COMMAND ${test_name})
        set_tests_properties(${filename_without_suffix} PROPERTIES LABELS "${ARG_LABELS}")
    endforeach()
endfunction()

include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        release-1.8.1
)
FetchContent_MakeAvailable(googletest)

set(test_sources norm.cc orthogonal.cc)
create_test_executables(SOURCES ${test_sources} LABELS "unit_tests")

set(regression_sources large_vector.cc)
create_test_executables(SOURCES ${regression_sources} LABELS "regression_tests")
