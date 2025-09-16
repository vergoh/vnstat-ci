FROM debian:unstable
ARG DEBIAN_FRONTEND=noninteractive
ADD https://github.com/crate-ci/typos/releases/download/v1.36.2/typos-v1.36.2-x86_64-unknown-linux-musl.tar.gz /tmp
RUN apt-get update && \
    apt-get -y --no-install-recommends install cppcheck doxygen graphviz && \
    apt-get clean && \
    cd /tmp && \
    tar zxvf typos-*-x86_64-unknown-linux-musl.tar.gz ./typos && \
    mv -v typos /usr/bin/ && \
    rm -f *.tar.gz
CMD ["/usr/bin/sh"]
