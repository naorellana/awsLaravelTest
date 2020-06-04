FROM ubuntu:18.04

RUN apt-get update -y

ENV DEBIAN_FRONTEND=noninteractive

RUN  apt install apache2 zip unzip -y
RUN apt install php php-pear php-curl php-dev php-gd php-mbstring \
 php-zip php-mysql php-xml php-token-stream \
 php-json php-zip -y

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install composer -y

RUN adduser apacheuser
RUN usermod -g www-data apacheuser
RUN chown -R  apacheuser:www-data /var/www/html/

USER apacheuser

#RUN cd /var/www/html && composer create-project --prefer-dist  laravel/laravel app

#USER root

#RUN chgrp -R www-data /var/www/html/app/ && chmod -R 775 /var/www/html/app/storage

COPY apache2.conf /etc/apache2/apache2.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
COPY script-canjeaton.sh /var/www/html/
#RUN service apache2 start

ENTRYPOINT [ "/var/www/html/script-canjeaton.sh" ]

#CMD apachectl -DFOREGROUND
