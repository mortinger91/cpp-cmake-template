[![cpp-cmake-template](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/cmake.yml/badge.svg?branch=master)](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/cmake.yml)

<h1>cpp-cmake-template</h1>
Template for a multi platform CMake C++ project that includes:

- VSCode files
- Github Actions
- Test suite using CTest
- Dockerfile

<h2>Set up project:</h2>
Execute script:

```./ProjectFolder/scripts/build_cmake.sh```<br>
or execute task "build_cmake" in VSCode.

<h2>Build and Run:</h2>
Execute script:

```./ProjectFolder/scripts/make_debug.sh```<br>
then run:<br>
```./ProjectFolder/build/debug/bin/cpp-cmake-template```<br>
or select and run a configuration in VSCode:<br>

- Debug
- Release

<h2>Run tests:</h2>
Execute script:

```./ProjectFolder/scripts/run_tests.sh```<br>
or execute task "run_tests" in VSCode.

To run tests in a Docker container:<br>
```docker compose down --volumes --rmi all```<br>
```docker compose up```

<h2>Notes:</h2>

- To add new files create a new folder in ProjectFolder/src,<br>
no CMake files need to be modified.<br>
You need to re-run "build_cmake".
- To add a new test just add a new test_***.cpp file<br>
in ProjectFolder/test.<br>
You need to re-run "build_cmake".
