[![cpp-cmake-template](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/cmake.yml/badge.svg?branch=master)](https://github.com/mortinger91/cpp-cmake-template/actions/workflows/cmake.yml)

<h1>cpp-cmake-template</h1>
Template for a multi platform CMake C++ project that includes:

- VSCode files
- Github Actions
- Test suite using CTest
- Dockerfile

<h2>Set up project:</h2>
Execute script:

```
./ProjectFolder/scripts/build_cmake_debug.sh
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or execute VSCode task ```build_cmake_debug```.

<h2>Build and Run in Debug:</h2>
Execute script:

```
./ProjectFolder/scripts/build_debug.sh
```

Then run:

```
lldb ./build/debug/bin/cpp-cmake-template
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or launch VSCode ```DEBUG``` configuration.

<h2>Run tests:</h2>
Execute script:

```
./ProjectFolder/scripts/run_tests.sh
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or execute VSCode task ```run_tests```.

To run tests in a Docker container:

```
docker compose down --volumes --rmi all
docker compose up
```

<h2>Build release:</h2>
Execute script:

```
./ProjectFolder/scripts/create_release.sh
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or execute VSCode task ```create_release```.

<h2>Notes:</h2>

- To add new files create a new folder in ```ProjectFolder/src```<br>
and add ```*.cpp``` and ```*.h``` files into it.<br>
&nbsp;&nbsp;&nbsp;&nbsp;You need to re-run ```build_cmake```.
- To add new tests, add a new ```test_***.cpp``` file in<br>
```ProjectFolder/test```.<br>
&nbsp;&nbsp;&nbsp;&nbsp;You need to re-run ```build_cmake```.

<h2>Possible future improvements:</h2>

- Linter
- Static checker (BASH and cpp)
- CMake install
