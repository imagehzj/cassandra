# docker run -p 9042:9042 -p 7000:7000 -d ttbb/cassandra:nake
FROM ttbb/base:jdk11

LABEL maintainer="shoothzj@gmail.com"

ARG version=4.0.0

RUN wget -O cassandra.tar.gz https://downloads.apache.org/cassandra/$version/apache-cassandra-$version-bin.tar.gz && \
mkdir -p /opt/sh/cassandra && \
tar -xf cassandra.tar.gz -C /opt/sh/cassandra --strip-components 1 && \
echo "export PATH=$PATH:/opt/sh/cassandra/bin" >> /etc/bashrc && \
rm -rf cassandra.tar.gz

WORKDIR /opt/sh/cassandra