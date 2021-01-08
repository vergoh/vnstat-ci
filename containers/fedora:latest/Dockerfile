FROM fedora:latest
RUN dnf -y install make gcc check check-devel gd gd-devel sqlite sqlite-devel
ADD lsb_release /usr/local/bin/
CMD ['/bin/sh']
