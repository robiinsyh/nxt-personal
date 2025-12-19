FROM ubuntu/apache2:2.4-22.04_beta
LABEL author="robiinsyh"

RUN apt-get update && apt-get install software-properties-common ca-certificates lsb-release apt-transport-https -y
RUN add-apt-repository ppa:ondrej/php -y
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
    php8.2-cli \
    php8.2-curl \
    php8.2-mbstring \
    php8.2-intl \
    php8.2-gd \
    php8.2-xml \
    php8.2-mysql \
    php8.2-zip \
    php8.2-soap \
    php8.2-sqlite3 \
    php8.2-bcmath \
    php8.2-gmp \
    php8.2-redis \
    php8.2-ldap \
    php8.2-imagick \
    php8.2-bz2 \
    librsvg2-bin \
    php8.2-imagick \
    libapache2-mod-php8.2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
RUN rm -rf /var/www/html/*
RUN git clone https://github.com/robiinsyh/nxt-personal.git
RUN mv nxt-personal/* . && rm -rf nxt-personal
COPY fix-permissions.sh /usr/local/bin/fix-permissions.sh
RUN chmod +x /usr/local/bin/fix-permissions.sh
#RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/conf.d/90-memory-limit.ini
RUN sed -i 's/memory_limit = .*/memory_limit = 512M/' /etc/php/8.2/apache2/php.ini 
RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite
RUN a2enmod php8.2
COPY nextcloud.conf /etc/apache2/sites-available/000-default.conf
EXPOSE 80

ENTRYPOINT ["fix-permissions.sh"]
CMD ["apache2-foreground"]
