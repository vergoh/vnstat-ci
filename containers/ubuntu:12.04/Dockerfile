FROM ubuntu:12.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y --no-install-recommends install build-essential check lsb-release \
      libgd2-noxpm libgd2-noxpm-dev pkg-config libsqlite3-0 libsqlite3-dev && \
    apt-get clean
CMD ['/bin/sh']

