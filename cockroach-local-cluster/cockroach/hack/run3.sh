#/bin/bash

docker run --rm -t --link proxy:serf --name cockroach3 nak3/cockroach
