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
    endforeach()
endfunction()

# Globbing has some disadvantages, see https://cmake.org/cmake/help/latest/command/file.html#filesystem
# file(GLOB test_sources RELATIVE ${CMAKE_CURRENT_LIST_DIR} CONFIGURE_DEPENDS *.cc)
set(test_sources norm.cc orthogonal.cc)

create_test_executables(SOURCES
    norm.cc
    orthogonal.cc)
