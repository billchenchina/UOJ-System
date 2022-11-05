#!/usr/bin/env bash

set -Eeuo pipefail

if [ -f /var/www/uoj/index.php ]; then
    # Develop environment
    find /etc/apache2/ -type f -name "*.conf" -exec sed -i "s|/usr/src|/var/www|g" {} +
fi

mkdir -p /var/uoj/data/upload/
mkdir -p /var/uoj/storage/{submission,tmp}/

if [ ! -f /usr/src/uoj/app/.config.php ]; then
    cp /usr/src/uoj/app/.default-config.php /var/uoj/config.php
    ln -s /var/uoj/config.php /usr/src/uoj/app/.config.php
fi

chown -R www-data:www-data /var/uoj

exec "$@"