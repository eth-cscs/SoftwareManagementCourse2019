cmake_minimum_required(VERSION 3.14)

project(dotprod VERSION 1.0.0 LANGUAGES CXX)

add_subdirectory(src)

add_subdirectory(tests)

include(cmake/export.cmake)
