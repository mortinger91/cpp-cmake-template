cmake_minimum_required(VERSION 3.18 FATAL_ERROR)

# Project
set(PROJECT_DESCRIPTION "Template CMake C++")
set(ONLINE_REPOSITORY "https://github.com/mortinger91/cpp-cmake-template")
project(
	"cpp-cmake-template"
		DESCRIPTION ${PROJECT_DESCRIPTION}
		HOMEPAGE_URL ${ONLINE_REPOSITORY}
)


# Additional settings
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
# set(CMAKE_POSITION_INDEPENDENT_CODE ON)
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
