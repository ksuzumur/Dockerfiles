FROM fedora:23

# Debug
RUN dnf install -y procps-ng iproute net-tools bind-utils telnet iputils vim-enhanced

# Install serf
RUN dnf install -y unzip wget
RUN wget --no-check-certificate -O /tmp/serf.zip https://releases.hashicorp.com/serf/0.7.0/serf_0.7.0_linux_amd64.zip
RUN unzip /tmp/serf.zip -d /tmp
RUN chmod +x /tmp/serf
RUN mv /tmp/serf /usr/local/bin/serf

# Install cockroach
#COPY build/src/github.com/cockroachdb/cockroach/cockroach /usr/local/bin/cockroach
#COPY bin/cockroach /usr/local/bin/cockroach
RUN wget --no-check-certificate -O /usr/local/bin/cockroach https://kenjiro.fedorapeople.org/misc/cockroach/cockroach
RUN chmod 755 /usr/local/bin/cockroach

# Install supervisor
RUN dnf install -y supervisor

# Supervisord config
ADD supervisord-cockroach.ini /etc/supervisord.d/supervisord-cockroach.ini

# Startup script (We need this to use environmetal variables with --link)
ADD start-serf.sh /start-serf.sh
RUN chmod 755 /start-serf.sh

ADD start-cockroach.sh /start-cockroach.sh
RUN chmod 755 /start-cockroach.sh

EXPOSE 26257
CMD ["supervisord", "-n"]
USER 1000
