cmake_minimum_required(VERSION 3.14)

project(dotprod LANGUAGES CXX)

add_subdirectory(src)

add_subdirectory(tests) # for part 3)

include(GNUInstallDirs)
install(FILES src/dotprod.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dotprod)
install(TARGETS dotprod DESTINATION ${CMAKE_INSTALL_LIBDIR})
