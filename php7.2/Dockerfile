FROM php:7.2-apache

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git zip unzip libssl-dev zlib1g-dev libmemcached-dev \
    && curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" \
    && mkdir -p /usr/src/php/ext/memcached \
    && tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
    && docker-php-ext-configure memcached \
    && docker-php-ext-install memcached \
    && rm /tmp/memcached.tar.gz \
    && mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/3.0.0.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

RUN docker-php-ext-install pdo pdo_mysql mysqli zip

RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

RUN pecl install redis memcached-2.2.0 xdebug
RUN docker-php-ext-enable xdebug

RUN apt-get -y --allow-unauthenticated install libgearman-dev wget unzip \
    && cd /tmp \
    && wget https://github.com/wcgallego/pecl-gearman/archive/gearman-2.0.3.zip \
    && unzip gearman-2.0.3.zip \
    && mv pecl-gearman-gearman-2.0.3 pecl-gearman \
    && cd pecl-gearman \
    && phpize \
    && ./configure \
    && make -j$(nproc) \
    && make install \
    && cd / \
    && rm /tmp/gearman-2.0.3.zip \
    && rm -r /tmp/pecl-gearman \
    && docker-php-ext-enable gearman

RUN pecl install mongodb

RUN docker-php-ext-install bcmath

RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer