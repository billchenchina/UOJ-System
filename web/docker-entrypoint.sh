#!/usr/bin/env bash

set -Eeuo pipefail

if [ -d /var/www/uoj ]; then
    # Develop environment
    find /etc/apache2/ -type f -name "*.conf" -exec sed -i "s|/usr/src|/var/www|g" {} +
fi

mkdir -p /var/uoj/data/upload/
mkdir -p /var/uoj/storage/{submission,tmp}/

chown -R www-data:www-data /var/uoj

exec "$@"