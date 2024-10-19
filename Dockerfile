FROM rust:latest as builder

ARG ANKI_VERSION

RUN apt update
RUN apt install -y protobuf-compiler
RUN cargo install --git https://github.com/ankitects/anki.git --tag ${ANKI_VERSION} anki-sync-server

FROM debian:stable-slim as runner

ENV TZ=Asia/Shanghai
ENV SYNC_USER1=user:pass
ENV SYNC_BASE=/syncserver
ENV UID=1000
ENV GID=1000
ENV SYNC_PORT=8080
ENV SYNC_HOST=0.0.0.0
ENV MAX_SYNC_PAYLOAD_MEGS=100

COPY --from=builder /usr/local/cargo/bin/anki-sync-server /usr/local/bin/anki-sync-server

#create ankisync user
RUN mkdir /syncserver \
&& useradd -u 1000 -U -d /syncserver -s /bin/false ankisync \
&& usermod -G users ankisync

USER ankisync

VOLUME /syncserver

ARG SYNC_PORT
EXPOSE ${SYNC_PORT}

CMD ["anki-sync-server"]
