FROM debian:oldoldstable
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y --no-install-recommends install build-essential check lsb-release \
      libgd3 libgd-dev libsqlite3-0 libsqlite3-dev && \
    apt-get clean
CMD ['/bin/sh']

