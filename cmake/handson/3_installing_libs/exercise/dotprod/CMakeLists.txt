cmake_minimum_required(VERSION 3.14)

project(dotprod CXX)

add_subdirectory(src)

add_subdirectory(tests)

include(GNUInstallDirs)
install(FILES src/dotprod.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dotprod )
install(TARGETS dotprod DESTINATION ${LIBDIR})
