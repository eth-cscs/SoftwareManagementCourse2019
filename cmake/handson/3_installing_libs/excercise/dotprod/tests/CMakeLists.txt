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
    add_dependencies(${test_name} googletest)
    ExternalProject_Get_Property(googletest SOURCE_DIR)
    target_include_directories(${test_name} PRIVATE ${SOURCE_DIR}/include)
    ExternalProject_Get_Property(googletest BINARY_DIR)
    target_link_directories(${test_name} PRIVATE ${BINARY_DIR})
    target_link_libraries(${test_name} gtest gtest_main pthread)
    target_link_libraries(${test_name} pthread) # don't do this (see presentation)
endfunction()

include(ExternalProject)
ExternalProject_Add(googletest
    SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/../external/googletest-1.7.0
    INSTALL_COMMAND ""
    )

set(test_sources norm.cc orthogonal.cc)

foreach(src IN LISTS test_sources)
    create_test_executable(SOURCE ${src})
endforeach()
