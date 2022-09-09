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
set(CMAKE_INSTALL_PREFIX /opt/DBow3x)
set(CMAKE_INSTALL_LIBDIR lib)

set(CMAKE_EXPORT_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})

add_library(DBow3x ${SOURCE})

include_directories(include)

target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBRARIES})

# Generate pkg-config file
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.pc.in ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)

install(DIRECTORY include/
        DESTINATION include
        COMPONENT main)

configure_package_config_file(${PROJECT_NAME}Config.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}config.cmake
        INSTALL_DESTINATION ${CMAKE_EXPORT_DESTINATION}
        )

install(TARGETS ${PROJECT_NAME}
        EXPORT ${PROJECT_NAME}Exports
        RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
        LIBRARY DESTINATION ${LIB_INSTALL_DIR} PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
        ARCHIVE DESTINATION ${LIB_INSTALL_DIR} COMPONENT main)			# Install the dll.a file in lib directory


install(EXPORT ${PROJECT_NAME}Exports DESTINATION ${CMAKE_EXPORT_DESTINATION})

write_basic_package_version_file(${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion
        )

install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
        DESTINATION ${CMAKE_EXPORT_DESTINATION}
        COMPONENT ${PROJECT_NAME}
        )

# Support automatic RPM/DEB generation via CPack
set(CPACK_CMAKE_GENERATOR ${CMAKE_GENERATOR})
set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
set(CPACK_PACKAGE_RELEASE ${VERSION})
set(CPACK_PACKAGE_CONTACT "polivicio@gmail.com")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Vincenzo Polizzi polivicio@gmail.com")
set(CPACK_PACKAGE_VENDOR "")
set(CPACK_PACKAGE_DESCRIPTION "DBow3 for x library, build with c++17")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY ${CPACK_PACKAGE_DESCRIPTION})
set(CPACK_PACKAGING_INSTALL_PREFIX /opt/DBow3x/)
# set(CPACK_DEBIAN_PACKAGE_DEPENDS "")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}.${CMAKE_SYSTEM_PROCESSOR}")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_COMPONENTS_GROUPING ALL_COMPONENTS_IN_ONE)
set(CPACK_DEB_COMPONENT_INSTALL YES)
set(CPACK_GENERATOR "DEB")
set(CPACK_RPM_PACKAGE_AUTOREQ 1)
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS 1)

include(CPack)


