FROM php:5.6-apache

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git zip unzip libssl-dev zlib1g-dev libmemcached-dev pkg-config


RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql

RUN pecl install redis memcached-2.2.0 xdebug-2.5.5
RUN pecl install mongodb-1.7.4

RUN docker-php-ext-install pdo pdo_mysql pgsql mysqli zip
RUN docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY php.ini /usr/local/etc/php/