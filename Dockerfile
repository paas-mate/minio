FROM shoothzj/base:go

WORKDIR /opt/minio

ARG TARGETARCH

RUN wget https://dl.min.io/server/minio/release/linux-$TARGETARCH/minio && \
wget https://dl.min.io/client/mc/release/linux-$TARGETARCH/mc && \
chmod +x /opt/minio/minio && \
chmod +x /opt/minio/mc && \
ln -s /opt/minio/minio /usr/bin/minio && \
ln -s /opt/minio/mc /usr/bin/mc

ENV MINIO_HOME /opt/minio
