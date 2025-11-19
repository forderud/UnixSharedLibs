FROM ubuntu:18.04

# Copy GEHC root certificates
COPY gehealthcarerootca1.crt gehealthcarerootca2.crt /usr/local/share/ca-certificates

# Install build tools
RUN apt-get update && apt-get install -y \
    # developer tools
    git \
    cmake \
    g++ \
    libglfw3-dev \
    libssl-dev \
    libboost-dev \
    # extra package repos (add-apt-repository)
    software-properties-common

# Install GEHC root certificates
RUN update-ca-certificates

# Add repo with GCC 13
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    && apt-get update -y \
    # Install GCC 13
    && apt-get install --no-install-recommends -y \
        libstdc++-13-dev \
        g++-13 \
