[![linux](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/linux.yml/badge.svg?branch=master)](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/linux.yml)
[![macos](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/macos.yml/badge.svg?branch=master)](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/macos.yml)
[![windows](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/windows.yml/badge.svg?branch=master)](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/windows.yml)

# cpp-cmake-template

### Template for a multi platform CMake C++ project that includes:

- VSCode files
- Github Actions
- Test suite using CTest
- Dockerfile

Requirements:
--------------
- CMake
- Clang
- LLDB
- VSCode 'CodeLLDB' extension (optional)
- Visual Studio, MSVC compiler (Windows only)

Set up project:
--------------
    ./ProjectFolder/scripts/build_cmake_debug.sh

or execute VSCode task `build_cmake_debug`.

Build and Debug:
----------------
    ./ProjectFolder/scripts/build_debug.sh

Followed by:

    lldb ./build/Debug/bin/cpp-cmake-template

or launch VSCode `DEBUG` configuration.

Run tests:
----------
    ./ProjectFolder/scripts/run_tests.sh

or execute VSCode task `run_tests`.

### Run tests in a Docker container:

    docker compose down --volumes --rmi all
    docker compose up

Build release:
--------------
    ./ProjectFolder/scripts/create_release.sh

or execute VSCode task ```create_release```.

Notes:
=======

- To add new files create a new folder in ```ProjectFolder/src```<br>
and add ```*.cpp``` and ```*.h``` files into it.<br>
You need to re-run ```build_cmake_debug```.
- To add new tests, add a new ```test_*.cpp``` file in<br>
```ProjectFolder/test```.<br>
You need to re-run ```build_cmake_debug```.

### Possible future improvements:

- Static checker (BASH and cpp)
- CMake install
