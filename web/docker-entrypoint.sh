#!/usr/bin/env bash

set -Eeuo pipefail

if [ ! -f /var/www/html/index.php ]; then
    rm -rf /var/www/html/*
    cp -r /usr/src/uoj/. /var/www/html/
    cp /var/www/html/app/.default-config.php /var/www/html/app/.config.php
fi

a2enmod rewrite headers && sed -i -e '172s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

exec $@