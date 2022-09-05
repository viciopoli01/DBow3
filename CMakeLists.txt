cmake_minimum_required(VERSION 3.16)

project(DBow3 VERSION 0.0.2 LANGUAGES C CXX)

set(SOURCE_dbow3
        src/BowVector.cpp
        src/Database.cpp
        src/DescManip.cpp
        src/FeatureVector.cpp
        src/QueryResults.cpp
        src/quicklz.c
        src/ScoringObject.cpp
        src/Vocabulary.cpp
        )

add_library(DBow3 ${SOURCE_dbow3})

include_directories(include)

target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBRARIES})

include(CMakePackageConfigHelpers)

install(DIRECTORY include/
        DESTINATION third_party/include
        )

install(EXPORT ${PROJECT_NAME}Exports DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})

install(TARGETS DBow3
        EXPORT ${PROJECT_NAME}Exports
        COMPONENT main
        RUNTIME DESTINATION bin)
