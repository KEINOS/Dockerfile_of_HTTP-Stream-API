#!/bin/sh
# Run this script inside the container for testing.
# =================================================

cd $(dirname $0)

name_host=$(hostname)
name_host=${name_host:-$(cat /etc/hostname)}

which curl > /dev/null
if [ $? -ne 0 ]; then
  apk add --update curl && sleep 3
fi

ps -a | grep run-server.sh | grep -v grep
if [ $? -ne 0 ]; then
  nohup ./run-server.sh > /dev/null &
  sleep 3
fi

curl -sI http://$name_host:80/
