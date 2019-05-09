cmake_minimum_required(VERSION 3.14)

project(dotprod VERSION 1.0.0 LANGUAGES CXX)

add_subdirectory(src)

include(GNUInstallDirs)
install(FILES src/dotprod.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dotprod )

install(TARGETS dotprod
    EXPORT dotprod-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )

add_subdirectory(tests)

include(cmake/export.cmake)
