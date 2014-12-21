FROM centos:centos6
MAINTAINER 0.1. Kenjiro Nakayama, nakayamakenjiro@gmail.com
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
RUN yum -y install httpd mod_perl
RUN echo 'hello' > /var/www/html/index.html
RUN mkdir -p /var/www/perl

ADD perl.conf /etc/httpd/conf.d/
ADD hello.pl /var/www/perl/

EXPOSE 80

ENTRYPOINT /usr/sbin/httpd && /bin/bash
# CMD ["-D", "FOREGROUND"]
