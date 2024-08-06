[![main](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/main.yml)

# cpp-cmake-template

## Template for a multi-platform C++ CMake project

### Main features:
- CTest unit tests framework
- Github Actions performing build and running the tests
- Scripts and VSCode files for ease of use
- Dockerfile for building and running the tests
- Support for compiler cache tools: ccache and sccache
- Formatting via clang-format (that runs automatically in a git pre-commit hook)

### Requirements:
- CMake
- Clang
- LLDB
- clang-format
- *(optional for compiler cache)* ccache
- *(optional for IDE debugging)* VSCode 'CodeLLDB' extension
- *(only on Windows)* MSVC compiler 

## Instructions

### How to set up the project:
Execute VSCode task `build_cmake_debug` or run this script:
    
    ./projectFolder/scripts/build_cmake_debug.sh

This needs to run the first time and any time you make  
changes to a CMake file or add new source files.

### How to build the project:
Execute VSCode task `build_debug` or run this script:
    
    ./projectFolder/scripts/build_debug.sh

To build for release execute VSCode task `create_release` or run this script:

    ./projectFolder/scripts/create_release.sh

All the artifacts will be in the build/ directory.

### How to debug the project:
Launch VSCode `DEBUG` configuration for IDE debugging.  
If you want to debug in the command line run:

    lldb ./build/Debug/bin/cpp-cmake-template

### How to run the tests:
Execute VSCode task `run_tests` or run this script:
    
    ./projectFolder/scripts/run_tests.sh

If you want to run the tests in a fresh Docker container, run these commands:

    docker compose down --volumes --rmi all
    docker compose up

### How to add new files to the project:
Add any new source file to a `projectFolder/src/dir` directory.  
You can create any new `projectFolder/src/dir` directories.  
Add any new test file to the `projectFolder/tests` directory.  
Both these operations does not require any changes to CMake files.  

__Remember to re-run `build_cmake_debug` after you have added new files or directories.__

### Windows:
Use the same VSCode tasks listed above or run the scripts in  
this directory: `projectFolder/scripts/windows`.

## Possible future improvements:

- Fix Windows built files path
- Static checker (BASH and cpp)
- E2E tests (other than just building, also running the binary to see if there are any run-time errors)
- CMake `install` to install the release build in the system
- Better support for 3rd parties libraries
