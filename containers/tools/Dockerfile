FROM alpine:edge
RUN apk update && \
    apk add --no-cache cppcheck doxygen graphviz && \
    rm -fr /var/cache/apk/*
CMD ['/bin/sh']
