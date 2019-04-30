cmake_minimum_required(VERSION 3.14)

project(dotprod CUDA)

include_directories(${PROJECT_SOURCE_DIR}/../external/cub-1.8.0)
add_library(dotprod src/dot_product_impl.cu)

install(DIRECTORY include DESTINATION .)
install(TARGETS dotprod DESTINATION lib)
