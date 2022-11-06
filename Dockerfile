FROM rust:alpine

RUN apk apk update &&\
    apk add --no-cache libc6-compat musl-dev

RUN cargo install -f --git https://github.com/timvisee/lazymc

ARG ARCHITECTURE=x64
ENV ARCHITECTURE $ARCHITECTURE
ENV MC_CONTAINER_NAME=minecraft

COPY ./lazymc.sh .
RUN mkdir /lazymc
WORKDIR /lazymc

CMD ["sh", "/lazymc.sh"]

EXPOSE 25565/tcp
EXPOSE 25565/udp