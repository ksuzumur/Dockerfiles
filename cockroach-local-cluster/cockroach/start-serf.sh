#!/bin/bash

exec serf agent \
    -tag role=db \
    -join $SERF_PORT_7946_TCP_ADDR:$SERF_PORT_7946_TCP_PORT > /tmp/serf.log 2>&1
