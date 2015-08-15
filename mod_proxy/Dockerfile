FROM centos:centos6
MAINTAINER 0.1. Kenjiro Nakayama, nakayamakenjiro@gmail.com
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
RUN yum -y install httpd
RUN echo 'hello' > /var/www/html/hello.html

ADD mod_proxy.conf /etc/httpd/conf.d/mod_proxy.conf

EXPOSE 8080

ENTRYPOINT /usr/sbin/httpd && /bin/bash
#CMD ["-D", "FOREGROUND"]
