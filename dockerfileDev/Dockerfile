FROM ubuntu:18.04

RUN apt update -y

ENV DEBIAN_FRONTEND=noninteractive

RUN \
 apt install apache2 zip unzip\
 php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring \
 php7.2-zip php7.2-mysql php7.2-xml php-token-stream \
 php7.2-json php php7.2-zip -y


RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5'){ echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --version=1.8.3
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer


RUN useradd canjeaweb
RUN usermod -g www-data canjeaweb
RUN chown -R  canjeaweb:www-data /var/www/html/

#USER canjeaweb

#RUN cd /var/www/html && composer create-project --prefer-dist  laravel/laravel canjeaton "5.7.*" 

#USER root

#RUN chgrp -R www-data /var/www/html/canjeaton && chmod -R 775 /var/www/html/canjeaton/storage

COPY apache2.conf /etc/apache2/apache2.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
COPY script-canjeaton.sh /var/www/html/
#RUN service apache2 start

ENTRYPOINT [ "/var/www/html/script-canjeaton.sh" ]

#CMD apachectl -DFOREGROUND
