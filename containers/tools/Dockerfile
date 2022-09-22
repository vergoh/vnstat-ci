FROM debian:unstable
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y --no-install-recommends install cppcheck doxygen graphviz && \
    apt-get clean
CMD ['/bin/sh']
