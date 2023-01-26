# Development / Testing image for C++ template cmake project

# base image used as the starting point for this image
FROM debian:latest

# ENV DEBIAN_FRONTEND=noninteractive

# Adding all required packages to the image
RUN apt-get update \
    && apt-get install -y \
		apt-utils \
        wget \
        curl \
        git \
        vim \
		build-essential \
        libtool autoconf pkg-config \
        ninja-build \
        clang \
        llvm \
        libc++-dev libc++abi-dev \
        cmake \        
        # libboost1.74-dev \
		libboost-all-dev \
		# compiler cash
        ccache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Enviroment variables
ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++

# Variable that can be overwritten at build time of the image
ARG TEST_VAR_DOCKERFILE=test

# ↑ Setup build environment
# ↓ Build and compile project

# Copying the actual folder of the project into the cointainer filesystem
COPY ProjectFolder /ProjectFolder

# Setting the working directory inside the project folder
WORKDIR /ProjectFolder/

# Running Cmake build script, all cmake files are generated
RUN scripts/cmake_build.sh

# Building the project using the build files generated by Cmake
RUN scripts/make_debug.sh

# The command that is run by default by the container when "docker run ..."/"docker start ..." is used
# CMD ["/bin/bash"]
CMD ["./build/debug/bin/template-cmake-cpp"]
