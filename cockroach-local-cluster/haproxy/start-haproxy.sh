#!/bin/bash

exec /usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -p /run/haproxy.pid 
