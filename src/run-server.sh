#!/bin/sh

which php > /dev/null
if [ $? -ne 0 ]; then
  echo '* You need PHP installed.'
  exit 1
fi

name_host=$(hostname)
name_host=${name_host:-$(cat /etc/hostname)}

echo '- Running built-in PHP Web server ...'
php -S $name_host:80 -t /app /app/router.php
