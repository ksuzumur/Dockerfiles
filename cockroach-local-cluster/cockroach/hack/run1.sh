#/bin/bash

docker run --rm -t --link proxy:serf --name cockroach1 nak3/cockroach
