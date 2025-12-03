#!/bin/sh
chown -R www-data:www-data /var/www/html/data
chown -R www-data:www-data /var/www/html/config

if [ -f /var/www/html/occ ]; then
    echo "Running automatic Nextcloud upgrade (if needed)"
    su -s /bin/sh www-data -c "php /var/www/html/occ upgrade" || true
fi

exec "$@"
