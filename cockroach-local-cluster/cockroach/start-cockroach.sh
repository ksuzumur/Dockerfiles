#!/bin/bash

TAG="db"

while ! serf info > /dev/null 2>&1
do
  echo "Wait until serf starts ...."
  sleep 1
done

SERF_RESULT=$(serf members -tag role=$TAG | awk '{print $3}' | grep alive | wc -l)
OWN_IP=$(awk 'NR==1 {print $1}' /etc/hosts)

if [ "${SERF_RESULT}" -gt 1 ]; then
  # Not initial start
  # TODO /tmp/data1 check
  exec cockroach start --stores=ssd=/tmp/data1 --gossip=http-lb=$SERF_PORT_7946_TCP_ADDR:$SERF_PORT_5000_TCP_PORT,$OWN_IP --addr=$OWN_IP --insecure=true > /tmp/cockroach.log 2>&1
else
  echo "Create initial data store"
  # This is initial start
  cockroach init --stores=ssd=/tmp/data1
  exec cockroach start --stores=ssd=/tmp/data1 --gossip=http-lb=$SERF_PORT_7946_TCP_ADDR:$SERF_PORT_5000_TCP_PORT,$OWN_IP --addr=$OWN_IP --insecure=true > /tmp/cockroach.log 2>&1
fi
