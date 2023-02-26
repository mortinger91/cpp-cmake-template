enable_testing()

# test_utility
add_executable(test_utility test_utility.cpp)
target_link_libraries(test_utility ${PROJECT_NAME}_LIB)
add_test(utility ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/test_utility)
