function(create_test_executables)
    set(options)
    set(oneValueArgs)
    set(multiValueArgs SOURCES)
    cmake_parse_arguments(ARG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    
    foreach(src IN LISTS ARG_SOURCES)
        get_filename_component(filename_without_suffix ${src} NAME_WE)
        set(test_name "test_${filename_without_suffix}")
        add_executable(${test_name} ${src})
        target_link_libraries(${test_name} dotprod)
        
        # link with googletest library
        add_dependencies(${test_name} googletest)
        ExternalProject_Get_Property(googletest SOURCE_DIR)
        target_include_directories(${test_name} PRIVATE ${SOURCE_DIR}/include)
        ExternalProject_Get_Property(googletest BINARY_DIR)
        target_link_directories(${test_name} PRIVATE ${BINARY_DIR})
        target_link_libraries(${test_name} gtest gtest_main pthread)
        target_link_libraries(${test_name} pthread) # don't do this (see presentation)
    endforeach()
endfunction()

include(ExternalProject)
ExternalProject_Add(googletest
    SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/../external/googletest-1.7.0
    INSTALL_COMMAND ""
    )

set(test_sources norm.cc orthogonal.cc)

create_test_executables(SOURCES ${test_sources})
