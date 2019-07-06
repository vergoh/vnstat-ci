FROM debian:unstable
RUN apt-get update && \
    apt-get -y --no-install-recommends install build-essential \
      clang-7 check lsb-release libgd3 libgd-dev \
      libsqlite3-0 libsqlite3-dev lcov && \
    apt-get clean
CMD ['/bin/sh']

