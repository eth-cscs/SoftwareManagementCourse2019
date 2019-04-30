cmake_minimum_required(VERSION 3.14)

project(dotprod CXX)

set(DOTPROD_ROOT "" CACHE STRING "Path to dotprod library")
set(CUDATOOLKIT_LIB_DIR "/usr/local/cuda/lib64" CACHE STRING "Path to the CUDA toolkit")

include_directories(${DOTPROD_ROOT}/include)
link_directories(${DOTPROD_ROOT}/lib)
link_directories(${CUDATOOLKIT_LIB_DIR})

add_executable(dotprodcl src/dotprodcl.cc)
target_link_libraries(dotprodcl dotprod)
target_link_libraries(dotprodcl cudart)
