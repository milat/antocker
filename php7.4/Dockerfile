FROM php:7.4-apache

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git zip unzip libssl-dev zlib1g-dev \
    && mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/3.0.0.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts

RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pdo_mysql mysqli pgsql redis bcmath

RUN pecl install redis memcached-2.2.0 xdebug mongodb
RUN docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini
RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongo.ini
RUN echo "extension=mongodb.so" >> /usr/local/etc/php/php.ini
RUN echo "extension=zip.so" >> /usr/local/etc/php/php.ini
