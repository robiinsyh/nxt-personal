FROM php:8.4-apache
RUN apt-get update && apt-get install -y git libzip-dev libgmp-dev libxml2-dev libjpeg-dev libpng-dev libpq-dev libldap2-dev libicu-dev libmagickwand-dev unzip  && \
    docker-php-ext-install zip pdo pdo_mysql\
        gd \
        zip \
        intl \
        opcache \
        pdo \
        ldap \
        bcmath \
        gmp \
        pcntl \
        mbstring \
        xml \
        imagick \
        cli \
        dev \
        redis \
        common

WORKDIR /var/www/html
RUN git clone https://github.com/robiinsyh/nxt-personal.git .
COPY fix-permissions.sh /usr/local/bin/fix-permissions.sh
RUN chmod +x /usr/local/bin/fix-permissions.sh
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/conf.d/90-memory-limit.ini
RUN sed -i 's/memory_limit = .*/memory_limit = 512M/' /usr/local/etc/php/conf.d/90-memory-limit.ini
RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite
COPY nextcloud.conf /etc/apache2/sites-available/000-default.conf
EXPOSE 80

ENTRYPOINT ["fix-permissions.sh"]
CMD ["apache2-foreground"]
