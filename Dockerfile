FROM ttbb/base

WORKDIR /opt/sh/minio

ARG TARGETARCH

RUN wget https://dl.min.io/server/minio/release/linux-$TARGETARCH/minio && \
wget https://dl.min.io/client/mc/release/linux-$TARGETARCH/mc && \
chmod +x /opt/sh/minio/minio && \
chmod +x /opt/sh/minio/mc && \
ln -s /opt/sh/minio/minio /usr/bin/minio && \
ln -s /opt/sh/minio/mc /usr/bin/mc

ENV MINIO_HOME /opt/sh/minio
