FROM php:5.6-apache

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git zip unzip
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN pecl install xdebug-2.5.5 php5.6-mysql mongodb
RUN docker-php-ext-enable xdebug

RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY php.ini /usr/local/etc/php/