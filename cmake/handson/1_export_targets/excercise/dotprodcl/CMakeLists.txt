cmake_minimum_required(VERSION 3.14)

project(dotprodcl CXX)

# TODO rewrite to use a selfmade find_package which exports a target via an interface library
set(DOTPROD_ROOT "${CMAKE_CURRENT_LIST_DIR}/../dotprod/install" CACHE STRING "Path to dotprod library")

find_package(Boost 1.66 REQUIRED
    COMPONENTS program_options
    )

set(FLOAT_TYPE "double" CACHE STRING "Floating point precision (float/double)" )
set_property(CACHE FLOAT_TYPE PROPERTY STRINGS "float;double")

add_executable(dotprodcl src/dotprodcl.cc)
target_link_libraries(dotprodcl Boost::program_options)
target_compile_definitions(dotprodcl PRIVATE ENABLE_LIBRARY)
if(${FLOAT_TYPE} STREQUAL "float")
    target_compile_definitions(dotprodcl PRIVATE PRECISION=4)
else()
    target_compile_definitions(dotprodcl PRIVATE PRECISION=8)
endif()

# Don't do the following, instead use an exported target
target_include_directories(dotprodcl PRIVATE ${DOTPROD_ROOT}/include)
target_link_directories(dotprodcl PRIVATE ${DOTPROD_ROOT}/lib64)
target_link_libraries(dotprodcl dotprod)
