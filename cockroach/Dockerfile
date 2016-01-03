FROM fedora:23

# Debug
RUN dnf install -y procps-ng iproute net-tools bind-utils telnet iputils vim-enhanced

# Install cockroach
#COPY build/src/github.com/cockroachdb/cockroach/cockroach /usr/local/bin/cockroach
#COPY bin/cockroach /usr/local/bin/cockroach
RUN dnf install -y wget
RUN wget --no-check-certificate -O /usr/local/bin/cockroach https://kenjiro.fedorapeople.org/misc/cockroach/cockroach
RUN chmod 755 /usr/local/bin/cockroach

EXPOSE 26257
ENTRYPOINT ["/usr/local/bin/cockroach"]
CMD ["cockroach start --stores=ssd=/tmp/data1 --gossip=http-lb=$COCKROACH_CLUSTER_SERVICE_HOST:$COCKROACH_CLUSTER_SERVICE_PORT,$(awk 'END {print $1}' /etc/hosts) --addr=$(awk 'END {print $1}' /etc/hosts) --insecure=true"]
USER 1000
