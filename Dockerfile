FROM debian:12-slim

# ENV DEBIAN_FRONTEND=noninteractive

# Adding all required packages to the image
RUN apt-get update \
    && apt-get install -y \
        apt-utils \
        git \
        build-essential \
        libtool autoconf pkg-config \
        clang \
        llvm \
        libc++-dev libc++abi-dev \
        cmake \
        libboost-all-dev \
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
COPY projectFolder /projectFolder

# Setting the working directory inside the project folder
WORKDIR /

RUN projectFolder/scripts/create_release.sh withTests

# The command that is run by default when the container starts
CMD ["./projectFolder/scripts/run_tests.sh", "Release"]
