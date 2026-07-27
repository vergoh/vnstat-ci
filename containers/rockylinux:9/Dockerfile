FROM rockylinux/rockylinux:9
RUN dnf -y install make gcc check check-devel gd gd-devel sqlite sqlite-devel liberation-sans-fonts
ADD lsb_release /usr/local/bin/
CMD ["/usr/bin/sh"]
