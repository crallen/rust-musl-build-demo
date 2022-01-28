FROM ubuntu:20.04

ARG BASE_ARCH=x86_64

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl

RUN curl https://more.musl.cc/${BASE_ARCH}-linux-musl/mips-linux-musl-cross.tgz \
        -s -o mips-linux-musl-cross.tgz && \
    tar xzf ./mips-linux-musl-cross.tgz && \
    rm ./mips-linux-musl-cross.tgz && \
    useradd -ms /bin/bash rusty

USER rusty
WORKDIR /home/rusty

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH="${PATH}:/home/rusty/.cargo/bin"

RUN rustup target add mips-unknown-linux-musl && \
    printf '[target.mips-unknown-linux-musl]\nlinker = "/mips-linux-musl-cross/bin/mips-linux-musl-gcc"' > ${HOME}/.cargo/config