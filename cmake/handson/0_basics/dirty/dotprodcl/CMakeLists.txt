cmake_minimum_required(VERSION 3.14)

project(dotprodcl CXX)

set(BOOST_ROOT "" CACHE STRING "Path to the Boost library")

find_package(Boost 1.66 REQUIRED
    COMPONENTS program_options
    )

include_directories(${Boost_INCLUDE_DIR})
link_directories(${Boost_LIBRARY_DIR_RELEASE})

add_executable(dotprodcl src/dotprodcl.cc)
target_link_libraries(dotprodcl boost_program_options)

