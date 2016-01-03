FROM fedora:23

# Debug
RUN dnf install -y procps-ng iproute net-tools bind-utils telnet iputils vim-enhanced

# Install cockroach
#COPY build/src/github.com/cockroachdb/cockroach/cockroach /usr/local/bin/cockroach
#COPY bin/cockroach /usr/local/bin/cockroach
RUN dnf install -y wget
RUN wget --no-check-certificate -O /usr/local/bin/cockroach https://kenjiro.fedorapeople.org/misc/cockroach/cockroach
RUN chmod 755 /usr/local/bin/cockroach

ADD start-cockroach.sh /start-cockroach.sh
RUN chmod 755 /start-cockroach.sh

EXPOSE 26257
#ENTRYPOINT ["cockroach"]
CMD ["/start-cockroach.sh"]
USER 1000
