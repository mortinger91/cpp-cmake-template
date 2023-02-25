cmake_minimum_required(VERSION 3.18 FATAL_ERROR)

# Project
set(PROJECT_DESCRIPTION "Template CMake C++")
set(ONLINE_REPOSITORY "https://github.com/mortinger91/cpp-cmake-template")
project("cpp-cmake-template"
		DESCRIPTION ${PROJECT_DESCRIPTION}
		HOMEPAGE_URL ${ONLINE_REPOSITORY})

include(cmake/StandardSettings.cmake)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set (CMAKE_POSITION_INDEPENDENT_CODE ON)

# C
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

# C++
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include_directories (${CMAKE_SOURCE_DIR})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/int")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/lib")

set(LIB_TARGET "Library")
set(SUBMODULES_TARGET "Submodules")

add_subdirectory(src/binary)
add_subdirectory(src/lib)
add_subdirectory(src/submodules)
add_subdirectory(tests)
