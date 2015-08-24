FROM openshift/base-centos7

MAINTAINER nakayamakenjiro@gmail.com

RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
RUN yum -y install httpd && \
    yum clean all -y
RUN echo 'hello' > /var/www/html/index.html

EXPOSE 80

env APACHE_RUN_USER    www-data
env APACHE_RUN_GROUP   www-data
env APACHE_PID_FILE    /var/run/apache2.pid
env APACHE_RUN_DIR     /var/run/apache2
env APACHE_LOCK_DIR    /var/lock/apache2
env APACHE_LOG_DIR     /var/log/apache2

env LANG               C
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
