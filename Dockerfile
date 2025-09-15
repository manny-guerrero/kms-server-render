FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/Wind4/vlmcsd/releases/download/svn1113/binaries.tar.gz && \
    tar -xzf binaries.tar.gz && \
    cp binaries/Linux/intel/static/vlmcsd-x64-musl-static /usr/bin/vlmcsd && \
    chmod +x /usr/bin/vlmcsd && \
    rm -rf binaries binaries.tar.gz && \
    apt-get clean

EXPOSE 1688

CMD ["vlmcsd", "-D", "-e", "-L", "0.0.0.0:1688"]
