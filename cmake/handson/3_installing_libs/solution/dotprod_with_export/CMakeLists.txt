cmake_minimum_required(VERSION 3.14)

project(dotprod VERSION 1.0.0 LANGUAGES CXX)

add_subdirectory(src)

include(GNUInstallDirs)
install(FILES src/dotprod.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dotprod )

add_subdirectory(tests)

include(cmake/export.cmake)
