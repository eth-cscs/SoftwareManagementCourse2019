function(create_test_executable)
    set(options)
    set(oneValueArgs SOURCE)
    set(multiValueArgs)
    cmake_parse_arguments(ARG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    
    string(REPLACE ".cc" "" filename_without_suffix ${ARG_SOURCE})
    set(test_name "test_${filename_without_suffix}")
    add_executable(${test_name} ${ARG_SOURCE})
    target_link_libraries(${test_name} dotprod)
endfunction()

# Globbing has some disadvantages, see https://cmake.org/cmake/help/latest/command/file.html#filesystem
# file(GLOB test_sources RELATIVE ${CMAKE_CURRENT_LIST_DIR} CONFIGURE_DEPENDS *.cc)

set(test_sources norm.cc orthogonal.cc)

foreach(src IN LISTS test_sources)
    create_test_executable(SOURCE ${src})
endforeach()
