[![main](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/main.yml)

# cpp-cmake-template

### Template for a multi platform CMake C++ project that includes:

- VSCode files
- Github Actions
- Test suite using CTest
- Dockerfile
- ccache (object files caching)
- clang-format (running automatically as pre-commit git hook)

Requirements:
-------------
- CMake
- Clang
- LLDB
- clang-format
- ccache (optional)
- VSCode 'CodeLLDB' extension (optional)
- Visual Studio, MSVC compiler (Windows only)

Set up project:
---------------
    ./ProjectFolder/scripts/build_cmake_debug.sh

or execute VSCode task `build_cmake_debug`.

Build and Debug:
----------------
    ./ProjectFolder/scripts/build_debug.sh

or execute VSCode task `build_debug`.

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

Windows:
--------
Use .ps1 scripts in `ProjectFolder/scripts/windows` folder  
or same VSCode tasks, as listed above.

Notes:
=======

- To add new files: 
    - create a new folder in ```ProjectFolder/src```  
    - add ```*.cpp``` and ```*.h``` files into it.
    - Remember to re-run ```build_cmake_debug```
- To add new tests: 
    - add new ```test_*.cpp``` files in ```ProjectFolder/test```.  
    - Remember to re-run ```build_cmake_debug```

### Possible future improvements:

- Fix Windows built files path
- Static checker (BASH and cpp)
- E2E tests (other than just building, also running the binary to see if there are any run-time errors)
- CMake install
