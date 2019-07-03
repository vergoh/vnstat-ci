FROM alpine:latest
RUN apk update && \
    apk add --no-cache gcc musl-dev make gd-dev sqlite-dev wget && \
    rm -fr /var/cache/apk/*

# Workaround: 'check-dev' package in Alpine is compiled without fork support causing tests to fail
RUN cd /tmp && \
    wget https://github.com/libcheck/check/releases/download/0.12.0/check-0.12.0.tar.gz && \
    tar zxvf check-0.12.0.tar.gz && \
    cd check-0.12.0 && \
    ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --localstatedir=/var && \
    make && make install && cd / && rm -fr /tmp/*

ADD lsb_release /usr/local/bin/
CMD ['/bin/sh']
