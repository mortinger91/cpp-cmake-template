# Add any new directory that you add in ProjectFolder/src here 
file(GLOB_RECURSE sources utility/*.cpp)
add_library(${PROJECT_NAME}_LIB ${sources})

target_compile_definitions(
	${PROJECT_NAME}_LIB
	PRIVATE
		# Add compile definitions here
)

target_compile_features(
	${PROJECT_NAME}_LIB
	PRIVATE
		c_std_11
		cxx_std_17
)

target_compile_options(
	${PROJECT_NAME}_LIB
	PRIVATE
		${DEFAULT_COMPILER_OPTIONS}
)

target_link_options(
	${PROJECT_NAME}_LIB
	PRIVATE
		${DEFAULT_LINKER_OPTIONS}
)

target_link_libraries(
	${PROJECT_NAME}_LIB
	PRIVATE
		# Add libraries to link to the binary here
)

set_target_properties(
	${PROJECT_NAME}_LIB
		PROPERTIES ENABLE_EXPORTS ON
)
