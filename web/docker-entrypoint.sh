#!/usr/bin/env bash

set -Eeuo pipefail

if [ -f /var/www/uoj/index.php ]; then
    # Develop environment
    find /etc/apache2/ -type f -name "*.conf" -exec sed -i "s|/usr/src|/var/www|g" {} +
fi

mkdir -p /var/uoj/data/upload/
mkdir -p /var/uoj/storage/{submission,tmp}/

if [ ! -f /usr/src/uoj/app/.config.php ]; then
    cp /usr/src/uoj/app/config-docker.php /var/uoj/config.php
    salt0=$(openssl rand -hex 16)
    salt1=$(openssl rand -hex 16)
    salt2=$(openssl rand -hex 16)
    salt3=$(openssl rand -hex 16)
    sed -i -e "s|salt1|$salt0|g" -e "s|salt1|$salt1|g" \
           -e "s|salt2|$salt2|g" -e "s|salt3|$salt3|g" /var/uoj/config.php
    ln -s /var/uoj/config.php /usr/src/uoj/app/.config.php
fi

chown -R www-data:www-data /var/uoj

exec "$@"