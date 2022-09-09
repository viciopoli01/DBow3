cmake_minimum_required(VERSION 2.18...3.16)

project(DBow3x VERSION 0.0.2 LANGUAGES C CXX)

# Set build flags, depending on the architecture
set(SOURCE
        src/BowVector.cpp
        src/Database.cpp
        src/DescManip.cpp
        src/FeatureVector.cpp
        src/QueryResults.cpp
        src/quicklz.c
        src/ScoringObject.cpp
        src/Vocabulary.cpp
        )
#################################
#
#          OpenCV >= 3.3.1
#
#################################
find_package(OpenCV REQUIRED)
if (OpenCV_FOUND)
    if (OpenCV_VERSION VERSION_LESS "3.3.1")
        message(FATAL_ERROR "OpenCV >= 3.3.1 not found")
    else ()
        message(STATUS "OpenCV ${OpenCV_VERSION} found.")
    endif ()
else ()
    message(FATAL_ERROR "OpenCV >= 3.3.1 not found")
endif ()

include(CMakePackageConfigHelpers)


SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_INSTALL_PREFIX}/${LIB_INSTALL_DIR}/cmake/ /usr/${LIB_INSTALL_DIR}/cmake )

# ----------------------------------------------------------------------------
#   Uninstall target, for "make uninstall"
# ----------------------------------------------------------------------------
CONFIGURE_FILE( "${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in" "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake" IMMEDIATE @ONLY)
ADD_CUSTOM_TARGET(uninstall "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")

# ----------------------------------------------------------------------------
# create configuration file from .in file (If you use windows take care with paths)
# ----------------------------------------------------------------------------

write_basic_package_version_file(${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion
        )

CONFIGURE_FILE("${PROJECT_SOURCE_DIR}/config.cmake.in" "${PROJECT_BINARY_DIR}/Find${PROJECT_NAME}.cmake")
CONFIGURE_FILE("${PROJECT_SOURCE_DIR}/config.cmake.in" "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake")
INSTALL(FILES "${PROJECT_BINARY_DIR}/Find${PROJECT_NAME}.cmake" DESTINATION ${CMAKE_INSTALL_PREFIX}/cmake/ )
install(FILES
        ${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
        ${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
        DESTINATION ${CMAKE_INSTALL_PREFIX}/cmake/${PROJECT_NAME}
        COMPONENT ${PROJECT_NAME}
        )

add_library(DBow3x ${SOURCE})

include_directories(include)

target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBRARIES})

install(DIRECTORY include/
        DESTINATION include
        COMPONENT main)

install(TARGETS ${PROJECT_NAME}
        RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
        LIBRARY DESTINATION ${LIB_INSTALL_DIR} PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
        ARCHIVE DESTINATION ${LIB_INSTALL_DIR} COMPONENT main)			# Install the dll.a file in lib directory



