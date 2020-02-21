#!/bin/bash

#instalar dependencias de proyecto y configuracion de aranque de proyecto
cd /var/www/html/app
composer install
cp .env.example .env
#php artisan key:generate
# Set group permissions
chgrp -R www-data /var/www/html/app/*
# Set folder permissions
chmod -R 775 /var/www/html/app/storage/*
apachectl -DFOREGROUND
#CMD apachectl -DFOREGROUND
#******como crear imagen y levantar contenedo
#docker run -it --name=BI10xProdContainer -p 3000:80 -v /home/norellanac/Documentos/volDockerContainers/laravel/10xBI:/var/www/html/app/ norellana/apache-composer
#sudo docker build  -t  norellana/apache-composer .
