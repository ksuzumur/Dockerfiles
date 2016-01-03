#!/bin/bash

exec serf agent -tag role=lb -node proxy \
  -event-handler "member-join=/handler/member_join.sh" \
  -event-handler "member-leave,member-failed=/handler/member_left.sh" >> /tmp/serf.log 2>&1
