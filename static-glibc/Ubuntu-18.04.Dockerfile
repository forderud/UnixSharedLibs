FROM ubuntu:18.04

# Install build tools
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    ca-certificates \
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
