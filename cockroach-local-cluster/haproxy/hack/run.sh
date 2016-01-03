#!/bin/bash

docker run -d -t -p 5000 -p 7946 --name proxy nak3/haproxy
