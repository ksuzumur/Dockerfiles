#/bin/bash

docker run --rm -t --link proxy:serf --name cockroach2 nak3/cockroach
