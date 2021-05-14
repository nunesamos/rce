cmake_minimum_required(VERSION 3.2)

project (CROWD_DETECTING)

set_property (GLOBAL PROPERTY USE_FOLDERS ON)

set (CMAKE_CXX_STANDARD 11)
set (CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory (lib)
add_subdirectory (sample)


enable_testing()

FIND_PACKAGE(Boost 1.66 COMPONENTS program_options regex filesystem REQUIRED)
IF (Boost_FOUND)
    INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIR})
    ADD_DEFINITIONS( "-DHAS_BOOST" )
ENDIF()

