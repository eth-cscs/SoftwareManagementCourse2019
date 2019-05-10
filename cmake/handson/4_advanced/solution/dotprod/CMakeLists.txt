cmake_minimum_required(VERSION 3.14)

project(dotprod VERSION 1.0.0 LANGUAGES CXX)

add_subdirectory(src)

option(BUILD_TESTING "Enable testing" ON)

if(BUILD_TESTING)
    enable_testing()
    add_subdirectory(tests)
endif()

include(cmake/export.cmake)
