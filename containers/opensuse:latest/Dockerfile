FROM opensuse:latest
RUN zypper -n --gpg-auto-import-keys install make gcc check check-devel \
      lsb-release openSUSE-release tar gd gd-devel sqlite3 sqlite3-devel
CMD ['/bin/sh']
