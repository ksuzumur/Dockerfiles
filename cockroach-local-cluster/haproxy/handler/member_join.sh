#!/bin/bash

if [ "x${SERF_TAG_ROLE}" != "xlb" ]; then
    echo "Not an lb. Ignoring member join."
    exit 0
fi
while read line; do
    ROLE=`echo $line | awk '{print \$3 }'`
    if [ "x${ROLE}" != "xdb" ]; then
        continue
    fi
    echo $line | \
        awk '{ printf "    server %s %s:26257/_status/details/local check\n", $1, $2 }' >>/etc/haproxy/haproxy.cfg
done

/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid -sf $(cat /var/run/haproxy.pid)
