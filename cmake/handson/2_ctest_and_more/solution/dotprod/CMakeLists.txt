#TODO depending on the order, we need to use the one with proper export

cmake_minimum_required(VERSION 3.14)

project(dotprod CXX)

option(BUILD_TESTING "Enable testing" ON)

add_library(dotprod src/dotprod.cc)

if(BUILD_TESTING)
    enable_testing()
    add_subdirectory(tests)
endif()

include(GNUInstallDirs)
install(FILES src/dotprod.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dotprod )
install(TARGETS dotprod DESTINATION ${LIBDIR})
