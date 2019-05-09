#[=======================================================================[.rst:
FindDotprod
-----------

Find the dotprod library.

Imported targets
^^^^^^^^^^^^^^^^

This module defines the following :prop_tgt:`IMPORTED` targets:

``Dotprod::Dotprod``
The dotprod library, if found.

Result variables
^^^^^^^^^^^^^^^^

This module will set the following variables in your project:

``Dotprod_FOUND``
true if the dotprod headers and libraries were found

Cache Variables
^^^^^^^^^^^^^^^

The following cache variables may also be set:

``Dotprod_INCLUDE_DIR``
  The directory containing ``foo.h``.
``Dotprod_LIBRARY``
  The path to the Foo library.

#]=======================================================================]

# find_package(PkgConfig)
# pkg_check_modules(PC_Dotprod QUIET Dotprod)

if(NOT(DEFINED Dotprod_ROOT_DIR))
    find_path(Dotprod_ROOT_DIR NAMES include/dotprod/dotprod.h
        DOC "Path to the dotprod install directory"
        PATHS
            ${Dotprod_DIR}
            ${DOTPROD_ROOT}
            $ENV{Dotprod_DIR}
            $ENV{DOTPROD_ROOT}
        )
endif()

find_library(Dotprod_LIBRARY
    NAMES dotprod
#    PATHS ${PC_Dotprod_LIBRARY_DIRS}
    HINTS
        ${Dotprod_ROOT_DIR}/lib64
        ${Dotprod_ROOT_DIR}/lib
    )
mark_as_advanced(Dotprod_LIBRARY)

find_path(Dotprod_INCLUDE_DIR
    NAMES dotprod/dotprod.h
#    PATHS ${PC_Dotprod_INCLUDE_DIRS}
    HINTS ${Dotprod_ROOT_DIR}/include
    )
mark_as_advanced(Dotprod_INCLUDE_DIR)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Dotprod
  FOUND_VAR Dotprod_FOUND
  REQUIRED_VARS
    Foo_LIBRARY
    Foo_INCLUDE_DIR
)

if(Dotprod_FOUND AND NOT TARGET Dotprod::Dotprod)
    add_library(Dotprod::Dotprod INTERFACE IMPORTED)
    target_include_directories(Dotprod::Dotprod INTERFACE ${Dotprod_INCLUDE_DIR})
    target_link_libraries(Dotprod::Dotprod INTERFACE ${Dotprod_LIBRARY})
endif()
