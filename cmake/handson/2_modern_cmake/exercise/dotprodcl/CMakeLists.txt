cmake_minimum_required(VERSION 3.14)

project(dotprodcl LANGUAGES CXX)

# The following, should be fixed in Part 2) of the exercise
set(DOTPROD_ROOT NOTFOUND CACHE STRING "Path to dotprod library")
if(NOT DOTPROD_ROOT)
    message(FATAL_ERROR "Set DOTPROD_ROOT to the installation of the Dotprod library")
endif()

include_directories(dotprodcl ${DOTPROD_ROOT}/include)
link_directories(dotprodcl ${DOTPROD_ROOT}/lib64)

find_package(Boost 1.66 REQUIRED
    COMPONENTS program_options
    )

set(FLOAT_TYPE "double" CACHE STRING "Floating point precision (float/double)" )
set_property(CACHE FLOAT_TYPE PROPERTY STRINGS "float;double")

if(${FLOAT_TYPE} STREQUAL "float")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DPRECISION=4")
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DPRECISION=8")
endif()

add_subdirectory(src)
