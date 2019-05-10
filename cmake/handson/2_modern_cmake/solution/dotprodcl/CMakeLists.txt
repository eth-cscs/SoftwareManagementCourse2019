cmake_minimum_required(VERSION 3.14)

project(dotprodcl LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

find_package(Dotprod REQUIRED)

find_package(Boost 1.66 REQUIRED
    COMPONENTS program_options
    )

set(FLOAT_TYPE "double" CACHE STRING "Floating point precision (float/double)")
set_property(CACHE FLOAT_TYPE PROPERTY STRINGS "float;double")

add_subdirectory(src)
