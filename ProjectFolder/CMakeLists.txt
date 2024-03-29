# v3.19 is required because lower versions do not support presets
cmake_minimum_required(VERSION 3.19 FATAL_ERROR)

# Setting up ccache or sccache
find_program(CCACHE "ccache")
if(CCACHE)
    message("${CCACHE} has been found in the system!")
    set(CMAKE_C_COMPILER_LAUNCHER ${CCACHE})
    set(CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE})
else()
    find_program(SCCACHE "sccache")
    if(SCCACHE)
        message("${SCCACHE} has been found in the system!")
        set(CMAKE_C_COMPILER_LAUNCHER ${SCCACHE})
        set(CMAKE_CXX_COMPILER_LAUNCHER ${SCCACHE})
    else()
        message("neither ccache or sccache have been found in the system!")
    endif(SCCACHE)
endif(CCACHE)

# Project
set(PROJECT_DESCRIPTION "Template CMake C++")
set(ONLINE_REPOSITORY "https://github.com/mortinger91/cpp-cmake-template")
project(
    "cpp-cmake-template"
        DESCRIPTION ${PROJECT_DESCRIPTION}
        HOMEPAGE_URL ${ONLINE_REPOSITORY}
)


set(CMAKE_CXX_VISIBILITY_PRESET hidden)
# Clang compile commands are generated here:
# build/Debug/compile_commands.json
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
endif()


set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/int")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/lib")

add_executable(${PROJECT_NAME} src/main.cpp)
add_subdirectory(src)
target_link_libraries(
    ${PROJECT_NAME}
    PRIVATE
        ${PROJECT_NAME}_LIB
)

option(BUILD_TESTS "Build tests" ON)
if (BUILD_TESTS)
    add_subdirectory(tests)
endif()
