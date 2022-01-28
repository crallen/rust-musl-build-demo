Rust musl cross compile demo
============================

This repo contains a simple example of using a Docker image to run cross compilation builds with Rust. We install the MIPS musl-based toolchain from [https://musl.cc](https://musl.cc) and then configure our Rust installation to use `gcc` from the toolchain.

For this demo we are targeting the `mips-unknown-linux-musl` triple.

Requirements
------------

- Docker
- Make

Running
-------

The `all` target is configured to build the Docker image and run a `cargo build` inside of it. All you need to run is:

```shell
make
```