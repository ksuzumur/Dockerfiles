FROM rhel7:latest

# Update the system
#RUN yum -y update
RUN yum -y install tomcat apr-util hostname openssl mailcap net-tools vim-enhanced
RUN yum clean all
EXPOSE 8080

RUN yum -y install tomcat-webapps tomcat-admin-webapps
