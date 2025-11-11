FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    git \
    cmake \
    g++ \
    libglfw3-dev \
    libssl-dev \
    libboost-dev \
