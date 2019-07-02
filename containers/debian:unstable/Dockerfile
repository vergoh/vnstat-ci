FROM debian:unstable
RUN apt-get update && \
    apt-get -y --no-install-recommends install build-essential \
      clang-7 cppcheck check lsb-release libgd3 libgd-dev \
      libsqlite3-0 libsqlite3-dev lcov cppcheck doxygen graphviz && \
    apt-get clean
CMD ['/bin/sh']

