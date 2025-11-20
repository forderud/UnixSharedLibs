FROM ubuntu:24.04

# Install build tools
RUN apt-get update && apt-get install -y \
    # required for building glibc from source
    ca-certificates \
    wget \
    bzip2 \
    gawk \
    bison \
    build-essential \
    linux-headers-generic \
    # developer tools
    git \
    cmake \
    g++ \
    libglfw3-dev \
    libssl-dev \
    libboost-dev \
    musl-tools musl-dev

# Install GEHC root certificates
COPY gehealthcarerootca1.crt gehealthcarerootca2.crt /usr/local/share/ca-certificates
RUN update-ca-certificates

# Install old glibc 2.26
WORKDIR /tmp
RUN wget https://ftp.gnu.org/gnu/glibc/glibc-2.26.tar.bz2 \
  && tar -xvf glibc-2.26.tar.bz2 \
  && mkdir glibc-2.26/build \
  && cd glibc-2.26/build \
  && ../configure --disable-werror --prefix=/usr/local/glibc-2.26 \
  && make -j4 \
  && make install

# TODO: Build & install new gcc/g++ against old glibc
