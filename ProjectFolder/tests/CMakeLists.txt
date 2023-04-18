enable_testing()

file(GLOB_RECURSE test_cpp_files *.cpp)

foreach(test_cpp_file ${test_cpp_files})
	string(FIND ${test_cpp_file} "/" last_slash_pos REVERSE)
	math(EXPR string_start "${last_slash_pos}+1")
	string(SUBSTRING ${test_cpp_file} ${string_start} -1 test_cpp_file_stripped)
	string(LENGTH ${test_cpp_file_stripped} str_len)
	math(EXPR new_str_len "${str_len}-4")
	string(SUBSTRING ${test_cpp_file_stripped} 0 ${new_str_len} test_name)

	add_executable(${test_name} ${test_cpp_file})
	target_link_libraries(${test_name} ${PROJECT_NAME}_LIB)
	add_test(${test_name} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${test_name})
endforeach()
