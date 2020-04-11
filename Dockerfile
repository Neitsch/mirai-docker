FROM rust:1.42-buster

RUN apt-get update && apt-get install z3

RUN git clone https://github.com/facebookexperimental/MIRAI mirai

WORKDIR mirai

RUN rustup override set $(cat rust-toolchain)

RUN ./setup.sh

RUN RUSTFLAGS='-Clink-arg=-L./binaries -Clink-arg=-lstdc++' cargo install  --path ./checker

ENV RUSTC_WRAPPER mirai
ENV RUSTFLAGS "-Z always_encode_mir"
ENV MIRAI_FLAGS "--diag=strict"

ENTRYPOINT [ "cargo", "build" ]
