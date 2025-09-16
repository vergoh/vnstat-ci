FROM debian:unstable
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y --no-install-recommends install build-essential \
      clang clang-tools libclang-rt-dev check lsb-release libgd3 libgd-dev \
      libsqlite3-0 libsqlite3-dev lcov man-db && \
    apt-get clean
CMD ["/usr/bin/sh"]

