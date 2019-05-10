cmake_minimum_required(VERSION 3.14)

project(dotprodcl LANGUAGES CXX)

find_package(Boost 1.66 REQUIRED
    COMPONENTS program_options
    )

set(FLOAT_TYPE "double" CACHE STRING "Floating point precision (float/double)")
set_property(CACHE FLOAT_TYPE PROPERTY STRINGS "float;double")

# Don't do this, set it on a target (see next session)
if("${FLOAT_TYPE}" STREQUAL "float")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DPRECISION=4")
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DPRECISION=8")
endif()

add_subdirectory(src)
