cmake_minimum_required(VERSION 3.14)

project(dotprod CXX)

add_library(dotprod src/dotprod.cc)

include(GNUInstallDirs)
install(FILES src/dotprod.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dotprod )
install(TARGETS dotprod DESTINATION ${LIBDIR})
