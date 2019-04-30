cmake_minimum_required(VERSION 3.14)

project(dotprodcl CXX)

find_package(Boost 1.66 REQUIRED
    COMPONENTS program_options
    )

add_executable(dotprodcl src/dotprodcl.cc)
target_link_libraries(dotprodcl Boost::program_options)
