install(EXPORT dotprod-targets
    FILE dotprod-targets.cmake
    NAMESPACE dotprod
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
    )

write_basic_package_version_file(dotprod-version.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
    )

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/dotprod-version.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
    )
