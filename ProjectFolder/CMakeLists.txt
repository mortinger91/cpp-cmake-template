cmake_minimum_required(VERSION 3.18 FATAL_ERROR)

# Project
set(PROJECT_DESCRIPTION "Template CMake C++")
set(ONLINE_REPOSITORY "https://github.com/mortinger91/cpp-cmake-template")
project(
	"cpp-cmake-template"
		DESCRIPTION ${PROJECT_DESCRIPTION}
		HOMEPAGE_URL ${ONLINE_REPOSITORY}
)

include(cmake/StandardSettings.cmake)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/int")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/lib")

include_directories (${CMAKE_SOURCE_DIR}/src)

add_executable (${PROJECT_NAME} src/main.cpp)
add_subdirectory(src)
target_link_libraries(
	${PROJECT_NAME}
	PRIVATE
		${PROJECT_NAME}_LIB
)

add_subdirectory(tests)
