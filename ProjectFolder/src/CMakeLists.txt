set(sources_list
	# Add here any file you want to add manually which is not in a
	# src/directory.
)

# Getting all the .cpp files in any src/directory.
file(GLOB directories */)
foreach(dir ${directories})
    if(IS_DIRECTORY ${dir})
		string(FIND ${dir} "/" last_slash_pos REVERSE)
		math(EXPR string_start "${last_slash_pos}+1")
		string(SUBSTRING ${dir} ${string_start} -1 dir_stripped)
		file(GLOB_RECURSE sources ${dir_stripped}/*.cpp)
		list(APPEND sources_list ${sources})
    endif()
endforeach()

add_library(${PROJECT_NAME}_LIB ${sources_list})

target_include_directories(
	${PROJECT_NAME}_LIB
	PUBLIC
		${CMAKE_SOURCE_DIR}/src
)

target_compile_definitions(
	${PROJECT_NAME}_LIB
	PUBLIC
		# Add compile definitions here
)

target_compile_features(
	${PROJECT_NAME}_LIB
	PUBLIC
		c_std_11
		cxx_std_17
)

set_target_properties(
	${PROJECT_NAME}_LIB
		PROPERTIES
			CXX_STANDARD_REQUIRED ON
			CXX_EXTENSIONS OFF
)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
	set(CUSTOM_COMPILE_OPTIONS
		-Wall
	)
	if (UNIX)
		list(APPEND CUSTOM_COMPILE_OPTIONS
			-Werror
			-Wpedantic 
			-Wextra 
		)
	endif()
	target_compile_options(
		${PROJECT_NAME}_LIB
		PUBLIC
			${CUSTOM_COMPILE_OPTIONS}
	)
endif()

target_link_options(
	${PROJECT_NAME}_LIB
	PUBLIC
		${DEFAULT_LINKER_OPTIONS}
)

target_link_libraries(
	${PROJECT_NAME}_LIB
	PUBLIC
		# Add libraries to link to the binary here
)
