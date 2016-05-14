#!/bin/bash

. env.sh

. create_volumes.sh

cat ${NAME}wordpress.tar.gz | docker cp - ${NAME}wordpress-volume:/var/www/
docker run --rm \
     --volumes-from ${NAME}wordpress-volume \
     --entrypoint chown \
     wordpress \
     -R www-data:www-data /var/www/html

cat ${NAME}wordpress-mariadb.tar.gz | docker cp - ${NAME}wordpress-mariadb-volume:/var/lib/
docker run --rm \
     --volumes-from ${NAME}wordpress-mariadb-volume \
     --entrypoint chown \
     mariadb \
     -R mysql:mysql /var/lib/mysql

. apps.sh
