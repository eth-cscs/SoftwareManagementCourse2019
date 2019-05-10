include(CMakePackageConfigHelpers)

install(EXPORT dotprod-targets
    FILE dotprod-targets.cmake
    NAMESPACE Dotprod::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
    )

write_basic_package_version_file(dotprod-version.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
    )

configure_package_config_file(cmake/dotprod-config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/dotprod-config.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake

install(
    FILES
        ${CMAKE_CURRENT_BINARY_DIR}/dotprod-config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/dotprod-version.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
    )
