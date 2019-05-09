cmake_minimum_required(VERSION 3.14)

project(dotprodcl CXX)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

find_package(Dotprod REQUIRED)

find_package(Boost 1.66 REQUIRED
    COMPONENTS program_options
    )

set(FLOAT_TYPE "double" CACHE STRING "Floating point precision (float/double)" )
set_property(CACHE FLOAT_TYPE PROPERTY STRINGS "float;double")

add_executable(dotprodcl src/dotprodcl.cc)
target_link_libraries(dotprodcl PRIVATE Boost::program_options)
target_link_libraries(dotprodcl PRIVATE Dotprod)
target_compile_definitions(dotprodcl PRIVATE ENABLE_LIBRARY)
if(${FLOAT_TYPE} STREQUAL "float")
    target_compile_definitions(dotprodcl PRIVATE PRECISION=4)
else()
    target_compile_definitions(dotprodcl PRIVATE PRECISION=8)
endif()
