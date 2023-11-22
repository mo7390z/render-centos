FROM centos:centos7.9.2009

# 安装 Shellinabox
RUN yum install -y git openssl-devel pam-devel zlib-devel autoconf automake libtool make openssh-server && \
    git clone https://github.com/shellinabox/shellinabox.git && cd shellinabox && \
    autoreconf -i && \
    ./configure --prefix=/usr/local/shellinabox && \
    make && make install

RUN echo 'root:mo45213Z@' | chpasswd

# 暴露 22 端口
EXPOSE 22 4200

# 启动 Shellinabox
CMD ["/usr/local/shellinabox/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
