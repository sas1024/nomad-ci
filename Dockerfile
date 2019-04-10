FROM alpine:latest

ENV NOMAD_VERSION=0.9.0
ENV GLIBC_VERSION=2.27-r0

RUN apk add --no-cache --virtual builddeps curl wget unzip
RUN curl -Ls https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk > /tmp/glibc-${GLIBC_VERSION}.apk && \
    apk add --no-cache --allow-untrusted /tmp/glibc-${GLIBC_VERSION}.apk && \
    rm /tmp/glibc-${GLIBC_VERSION}.apk

RUN curl -Ls https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip > nomad.zip && \
    unzip nomad.zip && \
    rm nomad.zip && \
    mv nomad /usr/bin/nomad && \
    chmod +x /usr/bin/nomad

RUN apk del builddeps