# utility.cpp
add_executable(test_utility test_utility.cpp)
target_link_libraries(test_utility ${LIB_TARGET})
add_test(utility ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/test_utility)
