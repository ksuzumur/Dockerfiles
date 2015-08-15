FROM centos:centos6
MAINTAINER 0.1. Kenjiro Nakayama, nakayamakenjiro@gmail.com
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
RUN yum -y install httpd
RUN echo 'hello' > /var/www/html/index.html

ADD mod_jk.conf /etc/httpd/conf.d/mod_jk.conf
ADD workers.properties /etc/httpd/conf.d/workers.properties
ADD uriworkermap.properties /etc/httpd/conf.d/uriworkermap.properties
ADD mod_jk.so /etc/httpd/modules/mod_jk.so

EXPOSE 8080

ENTRYPOINT /usr/sbin/httpd && /bin/bash
#CMD ["-D", "FOREGROUND"]
