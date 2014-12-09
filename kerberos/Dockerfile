FROM centos:centos6
MAINTAINER 0.1. Kenjiro Nakayama, nakayamakenjiro@gmail.com
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6

RUN yum -y install krb5-server krb5-workstation openssh-server

ADD kdc.conf  /var/kerberos/krb5kdc/kdc.conf
ADD krb5.conf /etc/krb5.conf
ADD kadm5.acl /var/kerberos/krb5kdc/kadm5.acl

EXPOSE 88 749 22

ENTRYPOINT /bin/bash
