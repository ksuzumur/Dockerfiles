FROM fedora:23

# Debug
RUN dnf install -y procps-ng iproute net-tools bind-utils telnet iputils vim-enhanced

# Install serf
RUN dnf install -y unzip wget
RUN wget --no-check-certificate -O /tmp/serf.zip https://releases.hashicorp.com/serf/0.7.0/serf_0.7.0_linux_amd64.zip
RUN unzip /tmp/serf.zip -d /tmp
RUN chmod +x /tmp/serf
RUN mv /tmp/serf /usr/local/bin/serf

# Install HAProxy
RUN dnf -y install haproxy

# Install supervisor
RUN dnf install -y supervisor

# Install basic packages for ruby
RUN dnf install -y ruby

# Add serf start script
ADD start-serf.sh /start-serf.sh
RUN chmod 755 /start-serf.sh

# Add HAProxy start script
ADD start-haproxy.sh /start-haproxy.sh
RUN chmod 755 /start-haproxy.sh

# Add Handler
ADD default_haproxy.cfg /etc/haproxy/haproxy.cfg
ADD supervisord-haproxy.ini /etc/supervisord.d/supervisord-haproxy.ini

RUN mkdir -p /handler
ADD handler/member_join.sh /handler/member_join.sh
ADD handler/member_left.sh /handler/member_left.sh

EXPOSE 5000
CMD ["supervisord", "-n"]
#USER 1000
