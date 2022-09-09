#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "DBow3x" for configuration "Release"
set_property(TARGET DBow3x APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(DBow3x PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libDBow3x.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS DBow3x )
list(APPEND _IMPORT_CHECK_FILES_FOR_DBow3x "${_IMPORT_PREFIX}/lib/libDBow3x.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
