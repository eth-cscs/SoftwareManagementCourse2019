cmake_minimum_required(VERSION 3.14)

project(dotprodcl LANGUAGES CXX)

# Don't do this, see excercises in next sessions
set(DOTPROD_ROOT "${CMAKE_CURRENT_LIST_DIR}/../dotprod/install" CACHE STRING "Path to dotprod library")

# Don't do this, instead set it on targets, and better export a target from your library (see next sessions)
include_directories(dotprodcl ${DOTPROD_ROOT}/include)
link_directories(dotprodcl ${DOTPROD_ROOT}/lib64)

find_package(Boost 1.66 REQUIRED
    COMPONENTS program_options
    )

set(FLOAT_TYPE "double" CACHE STRING "Floating point precision (float/double)" )
set_property(CACHE FLOAT_TYPE PROPERTY STRINGS "float;double")

# Don't do this, set it on a target (see next session)
if(${FLOAT_TYPE} STREQUAL "float")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DPRECISION=4")
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DPRECISION=8")
endif()

# Don't do this, set it on a target (see next session)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DENABLE_LIBRARY")

add_subdirectory(src)
