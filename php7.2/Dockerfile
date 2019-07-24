FROM php:7.2-apache

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git zip unzip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer