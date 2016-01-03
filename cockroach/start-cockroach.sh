#!/bin/bash

OWN_IP=$(awk 'END {print $1}' /etc/hosts)
CURL_TIMEOUT=5

curl --connect-timeout $CURL_TIMEOUT $COCKROACH_CLUSTER_SERVICE_HOST:$COCKROACH_CLUSTER_SERVICE_PORT > /dev/null 2>&1

if [ $? -ne 0 ]; then
  echo "Initialize Database since this is initial container"
  echo "Check init" > /tmp/test1
  cockroach init --stores=ssd=/tmp/data1
fi

cockroach start --stores=ssd=/tmp/data1 --gossip=http-lb=$COCKROACH_CLUSTER_SERVICE_HOST:$COCKROACH_CLUSTER_SERVICE_PORT,$OWN_IP --addr=$OWN_IP --insecure=true
