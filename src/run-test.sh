#!/bin/sh
# Run this script inside the container for testing.
# =================================================
echo '============'
echo ' Begin test'
echo '============'

cd $(dirname $0)

name_host=$(hostname)
name_host=${name_host:-$(cat /etc/hostname)}
echo "- Local host name is: ${name_host}"

printf "- Check: cURL installed ... "
which curl
if [ $? -ne 0 ]; then
  echo 'NG'
  apk add --update curl && sleep 3
fi

printf "- Check: Is Server Up ... "
ps -a | grep run-server.sh | grep -v grep
if [ $? -ne 0 ]; then
  echo 'NO. Calling up server.'
  ./run-server.sh &&
  sleep 3
fi

echo '=============='
echo ' Running test'
echo '=============='
echo '- Get server response header:'
curl -sI http://$name_host:80/
