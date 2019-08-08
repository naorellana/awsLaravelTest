FROM ubuntu:18.04

RUN apt update -y

ENV DEBIAN_FRONTEND=noninteractive

RUN \
 apt install apache2 zip unzip\
 php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring \
 php7.2-zip php7.2-mysql php7.2-xml php-token-stream \
 php7.2-json php php7.2-zip -y


RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer


RUN useradd canjeaweb
RUN usermod -g www-data canjeaweb
RUN chown -R  canjeaweb:www-data /var/www/html/

#USER canjeaweb

#RUN cd /var/www/html && composer create-project --prefer-dist  laravel/laravel canjeaton 

#USER root

#RUN chgrp -R www-data /var/www/html/canjeaton/* && chmod -R 775 /var/www/html/canjeaton/storage/*

COPY apache2.conf /etc/apache2/apache2.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
COPY script-canjeaton.sh /var/www/html/
#RUN service apache2 start

ENTRYPOINT [ "/var/www/html/script-canjeaton.sh" ]

#CMD apachectl -DFOREGROUND
