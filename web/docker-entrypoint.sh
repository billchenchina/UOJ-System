#!/usr/bin/env bash

set -Eeuo pipefail

if [ ! -f /var/www/html/index.php ]; then
    rm -rf /var/www/html/*
    cp -r /usr/src/uoj/. /var/www/html/
    cp /var/www/html/app/.default-config.php /var/www/html/app/.config.php
fi

chown -R www-data:www-data /var/www/html/app/storage/

if [ ! -f /var/uoj_data/.UOJSetupDone ]; then
    mkdir -p /var/uoj_data/
    chown -R www-data:www-data /var/uoj_data/
    touch /var/uoj_data/.UOJSetupDone

fi
a2enmod rewrite headers && sed -i -e '172s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
a2ensite 000-uoj.conf && a2dissite 000-default.conf
exec $@