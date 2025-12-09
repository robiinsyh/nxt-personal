FROM ubuntu/apache2
RUN apt-get update && apt-get install nano -y \
    git \
    unzip \
    libzip-dev \
    libgmp-dev \
    libxml2-dev \
    libjpeg-dev \
    libpng-dev \
    libpq-dev \
    libldap2-dev \
    libicu-dev \
    libmagickwand-dev \
    libwebp-dev \
    libfreetype6-dev \
    pkg-config \
    libonig-dev \
    ffmpeg \
    imagemagick \
    php8.2 \
    php8.2fpm \
    php8.2cli \
    php8.2bz2 \
    php8.2curl \
    php8.2mbstring \
    php8.2intl \
    php8.2gd \
    php8.2xml \
    php8.2mysql \
    php8.2zip \
    php8.2soap \
    php8.2sqlite3 \
    php8.2imagick \
    php8.2redis \
    php8.2bcmath \
    php8.2gmp \
    php8.2bcmath \
    librsvg2bin \
    php8.2imagick \
    && rm -rf /var/lib/apt/lists/*
    
WORKDIR /var/www/html
RUN git clone https://github.com/robiinsyh/nxt-personal.git .
COPY fix-permissions.sh /usr/local/bin/fix-permissions.sh
RUN chmod +x /usr/local/bin/fix-permissions.sh
#RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/conf.d/90-memory-limit.ini
RUN sed -i 's/memory_limit = .*/memory_limit = 512M/' /etc/php/8.2/fpm/php.ini
RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite
COPY nextcloud.conf /etc/apache2/sites-available/000-default.conf
EXPOSE 80

ENTRYPOINT ["fix-permissions.sh"]
CMD ["apache2-foreground"]
