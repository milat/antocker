FROM php:5.6-apache

COPY php.ini /usr/local/etc/php/

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN pecl install xdebug-2.5.5
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini