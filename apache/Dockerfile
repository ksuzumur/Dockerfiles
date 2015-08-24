FROM openshift/base-centos7

MAINTAINER nakayamakenjiro@gmail.com

RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
RUN yum -y install httpd && \
    yum clean all -y
RUN echo 'hello' > /var/www/html/index.html

EXPOSE 80

COPY httpdconf.sed /tmp/
RUN sed -i -f /tmp/httpdconf.sed /etc/httpd/conf/httpd.conf

env LANG               C
CMD ["/usr/sbin/httpd", "--pidfile=/tmp/httpd.pid", "-D", "FOREGROUND"]
