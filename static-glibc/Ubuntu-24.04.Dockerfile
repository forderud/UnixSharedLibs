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

