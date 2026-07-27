FROM opensuse/tumbleweed:latest
RUN zypper -n --gpg-auto-import-keys install make gcc gzip check check-devel \
      openSUSE-release tar gd gd-devel sqlite3 sqlite3-devel liberation-fonts
ADD lsb_release /usr/local/bin/
CMD ["/usr/bin/sh"]
