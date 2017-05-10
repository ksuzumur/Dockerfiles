# This image provides a Python 3.3 environment you can use to run your Python
# applications.
FROM centos:latest

EXPOSE 8080

# To use subscription inside container yum command has to be run first (before yum-config-manager)
# https://access.redhat.com/solutions/1443553
RUN INSTALL_PKGS="nss_wrapper httpd24 \
        httpd24-httpd-devel httpd24-mod_ssl httpd24-mod_auth_kerb httpd24-mod_ldap httpd24-mod_session \
	atlas-devel gcc-gfortran libffi-devel libtool-ltdl" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    yum clean all -y

RUN chown -R 1001:0 /opt/app-root && chmod -R ug+rwx /opt/app-root

USER 1001

CMD ["/usr/local/apache2/bin/apachectl","-D","FOREGROUND"]
