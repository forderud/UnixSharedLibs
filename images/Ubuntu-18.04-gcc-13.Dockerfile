FROM ubuntu:18.04

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
COPY gehealthcarerootca1.crt gehealthcarerootca2.crt /usr/share/ca-certificates
RUN update-ca-certificates

# Add repo with GCC 13
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    # Install GCC 13
    && apt-get install --no-install-recommends -y \
        libstdc++-13-dev \
        g++-13 \
    # Set GCC 13 as default
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 13 \
      --slave /usr/bin/g++ g++ /usr/bin/g++-13
