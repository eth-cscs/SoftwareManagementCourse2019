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
    # TODO
    )

find_path(Dotprod_INCLUDE_DIR
    # TODO
    )

if(Dotprod_LIBRARY)
    add_library(Dotprod::Dotprod INTERFACE IMPORTED)
    # TODO
else()
    # TODO
endif()
