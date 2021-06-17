FROM php:5.6-apache

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git zip unzip libssl-dev zlib1g-dev libmemcached-dev
RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

RUN pecl install redis memcached-2.2.0 xdebug-2.5.5 channel://pecl.php.net/mongo
RUN docker-php-ext-enable xdebug

RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini
RUN echo "extension=mongo.so" > /usr/local/etc/php/conf.d/mongo.ini
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY php.ini /usr/local/etc/php/