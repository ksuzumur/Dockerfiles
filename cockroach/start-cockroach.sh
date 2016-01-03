#!/bin/bash

OWN_IP=$(awk 'END {print $1}' /etc/hosts)

cockroach start --stores=ssd=/tmp/data1 --gossip=http-lb=$COCKROACH_CLUSTER_SERVICE_HOST:$COCKROACH_CLUSTER_SERVICE_PORT,$OWN_IP --addr=$OWN_IP --insecure=true
