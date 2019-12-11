FROM centos:centos6.9

RUN yum -y install wget epel-release
RUN yum -y update
RUN curl -o /etc/yum.repos.d/abo-mcb32tools-epel-6.repo https://copr.fedorainfracloud.org/coprs/abo/mcb32tools/repo/epel-6/abo-mcb32tools-epel-6.repo
RUN yum -y install @development bison flex libtool texinfo zlib-devel m4 libftdi-devel
RUN yum -y update
RUN yum clean all
RUN mkdir -p /opt/mcb32tools/src
RUN cd /opt/mcb32tools/src && wget -O mcb32tools-2.2.zip https://github.com/is1200-example-projects/mcb32tools/archive/v2.2.zip
RUN cd /opt/mcb32tools/src && unzip mcb32tools-2.2.zip
RUN cd /opt/mcb32tools/src/mcb32tools-2.2 && make
RUN tar -zcf /opt/mcb32tools-bin-2.2.tar.gz -C /opt/mcb32tools .
RUN yum -y remove dbus-glib
