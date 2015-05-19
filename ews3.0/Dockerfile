#FROM rhel7:latest
FROM centos:centos7

# Update the system
RUN yum -y update
RUN yum -y install unzip apr-util hostname openssl mailcap net-tools vim-enhanced
RUN yum clean all

ADD jws-httpd-3.0.0-RHEL7-x86_64.zip /opt/
RUN unzip -q /opt/jws-httpd-3.0.0-RHEL7-x86_64.zip -d /opt/

# Remove unneeded zip files
RUN rm /opt/*.zip

RUN echo 'hello' > /opt/jws-3.0/httpd/www/html/index.html
RUN sed -i -e s/Listen\ 127\.0\.0\.1\:80/Listen\ 0\.0\.0\.0\:80/g /opt/jws-3.0/httpd/conf/httpd.conf

# Run the postinstall script
RUN cd /opt/jws-3.0/httpd && ./.postinstall

#USER apache
EXPOSE 80

ENTRYPOINT /opt/jws-3.0/httpd/sbin/httpd -f /opt/jws-3.0/httpd/conf/httpd.conf && /bin/bash
#CMD ["/opt/jws-3.0/httpd/sbin/httpd", "-DFOREGROUND", "-f", "/opt/jws-3.0/httpd/conf/httpd.conf"]
