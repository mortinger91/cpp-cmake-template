# Add here any file that you want to be part of the library target,
# but it is not in a projectFolder/src/dir directory
set(sources_list
    # anotherFolder/myfile.cpp
)
# Get all the .cpp files in any projectFolder/src/dir directory
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
# Create a library target that contains all of the sources
add_library(${PROJECT_NAME}_LIB ${sources_list})
# Add the include directories to the library target.
# Remember to add any include that is not in a projectFolder/src/dir directory
target_include_directories(
    ${PROJECT_NAME}_LIB
    PUBLIC
        ${CMAKE_SOURCE_DIR}/src
)

# Define the compiler flags based on the build type
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(COMPILER_FLAGS
        -Wall
        -O0
    )
    if(UNIX)
        list(APPEND COMPILER_FLAGS
            -Werror
            -Wpedantic
            -Wextra
        )
    endif()
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(COMPILER_FLAGS
        -O3
        -DNDEBUG
    )
    if(UNIX)
        list(APPEND COMPILER_FLAGS
            -march=native
            -ffast-math
        )
    endif()
endif()
# Set the compiler flags for the library target
target_compile_options(
    ${PROJECT_NAME}_LIB
    PUBLIC
        ${COMPILER_FLAGS}
)

# Define the preprocessor macros based on the build type.
# This is equivalent to using #define in the source code
# or using -D flags as a compiler option
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(PREPROCESSOR_MACROS
        DEBUG
    )
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(PREPROCESSOR_MACROS
        RELEASE
        )
endif()
# Set the preprocessor macros for the library target
target_compile_definitions(
    ${PROJECT_NAME}_LIB
    PUBLIC
        ${PREPROCESSOR_MACROS}
)

# Set the C++ language features for the library target
target_compile_features(
    ${PROJECT_NAME}_LIB
    PUBLIC
        c_std_11
        cxx_std_17
)
# Ensure that the C++ standard is mandatory
# and disable compiler-specific extensions
set_target_properties(
    ${PROJECT_NAME}_LIB
        PROPERTIES
            CXX_STANDARD_REQUIRED ON
            CXX_EXTENSIONS OFF
)

# Define the linker options based on the build type
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(LINKER_OPTIONS
    )
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(LINKER_OPTIONS
        -Wl,--strip-all # Strip debug symbols
        -flto           # Enable link-time optimizations
    )
endif()
if(UNIX)
    list(APPEND LINKER_OPTIONS
        -Wl,--no-undefined # Fail if there are any unresolved symbols in the final linked output
    )
# Set the linker options for the library target
target_link_options(
    ${PROJECT_NAME}_LIB
    PUBLIC
        ${LINKER_OPTIONS}
)

target_link_libraries(
    ${PROJECT_NAME}_LIB
    PUBLIC
        # Add libraries to link to the binary here
)
