FROM shoothzj/compile:go AS compiler

RUN git clone --depth 1 https://github.com/minio/minio

COPY hack/gen-ldflags.go /minio/buildscripts/gen-ldflags.go
COPY hack/Makefile /minio/Makefile

RUN cd minio && \
make build

FROM shoothzj/base:go

WORKDIR /opt/minio

ARG TARGETARCH

COPY --from=compiler /minio/minio /opt/minio/minio

RUN wget -q https://dl.min.io/client/mc/release/linux-$TARGETARCH/mc && \
chmod +x /opt/minio/mc && \
ln -s /opt/minio/minio /usr/bin/minio && \
ln -s /opt/minio/mc /usr/bin/mc

ENV MINIO_HOME /opt/minio
