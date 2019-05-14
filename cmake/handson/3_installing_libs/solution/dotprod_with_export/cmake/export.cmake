include(GNUInstallDirs)

install(FILES src/dotprod.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dotprod)

install(EXPORT dotprod-targets
    FILE dotprod-targets.cmake
    NAMESPACE Dotprod::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
    )


include(CMakePackageConfigHelpers)

write_basic_package_version_file(dotprod-config-version.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
    )

configure_package_config_file(cmake/dotprod-config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/dotprod-config.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
    )

install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/dotprod-config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/dotprod-config-version.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
    )
