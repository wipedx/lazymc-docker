FROM rust:alpine


# hadolint ignore=DL3018
RUN apk apk update &&\
    apk add --no-cache libc6-compat musl-dev &&\
    cargo install -j 1 -f --git https://github.com/timvisee/lazymc

ARG ARCHITECTURE=x64
ENV ARCHITECTURE $ARCHITECTURE
ENV MC_CONTAINER_NAME=minecraft

RUN mkdir /lazymc
WORKDIR /lazymc

COPY ./lazymc.sh /lazymc.sh

CMD ["sh", "/lazymc.sh"]

EXPOSE 25565/tcp
EXPOSE 25565/udp