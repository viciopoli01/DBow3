# ===================================================================================
#  DBow3x CMake configuration file
#
#             ** File generated automatically, do not modify **
#
#  Usage from an external project:
#    In your CMakeLists.txt, add these lines:
#
#    FIND_PACKAGE(DBow3x REQUIRED )
#    TARGET_LINK_LIBRARIES(MY_TARGET_NAME )
#
#    This file will define the following variables:
#      - DBow3x_LIBS          : The list of libraries to links against.
#      - DBow3x_LIB_DIR       : The directory where lib files are. Calling LINK_DIRECTORIES
#                                with this path is NOT needed.
#      - DBow3x_VERSION       : The  version of this PROJECT_NAME build. Example: "1.2.0"
#      - DBow3x_VERSION_MAJOR : Major version part of VERSION. Example: "1"
#      - DBow3x_VERSION_MINOR : Minor version part of VERSION. Example: "2"
#      - DBow3x_VERSION_PATCH : Patch version part of VERSION. Example: "0"
#
# ===================================================================================
INCLUDE_DIRECTORIES("/home/viciopoli/InstalledLibs/DBow3x/include")
SET(DBow3x_INCLUDE_DIRS "/home/viciopoli/InstalledLibs/DBow3x/include")

LINK_DIRECTORIES("/home/viciopoli/InstalledLibs/DBow3x/")
SET(DBow3x_LIB_DIR "/home/viciopoli/InstalledLibs/DBow3x/")

SET(DBow3x_LIBS  DBow3x)
SET(DBow3x_LIBRARIES  DBow3x)

SET(DBow3x_FOUND YES)
SET(DBow3x_FOUND "YES")
SET(DBow3x_VERSION        0.0.2)
SET(DBow3x_VERSION_MAJOR  0)
SET(DBow3x_VERSION_MINOR  0)
SET(DBow3x_VERSION_PATCH  2)
