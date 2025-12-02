#!/bin/sh
chown -R www-data:www-data /var/www/html/data
chown -R www-data:www-data /var/www/html/config
exec "$@"