FROM centos:6
RUN sed -i -e 's:^mirrorlist:#mirrorlist:g' -e 's:^#baseurl:baseurl:g' -e 's:mirror.centos.org:vault.centos.org:g' /etc/yum.repos.d/*.repo
RUN yum -y install make gcc check check-devel gd gd-devel sqlite sqlite-devel
ADD lsb_release /usr/local/bin/
CMD ['/bin/sh']
