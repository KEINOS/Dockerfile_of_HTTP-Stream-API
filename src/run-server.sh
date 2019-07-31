#!/bin/sh
echo '===================='
echo ' Booting Web Server'
echo '===================='

printf '- Check: Is PHP installed ... '
which php
if [ $? -ne 0 ]; then
  echo 'NO'
  echo '* You need PHP installed.'
  exit 1
fi

name_host=$(hostname)
name_host=${name_host:-$(cat /etc/hostname)}
echo "- Listen: http://${name_host}:80/ (Inside local network only)"

echo '- Running built-in PHP Web server ...'
php -S $name_host:80 -t /app /app/router.php
