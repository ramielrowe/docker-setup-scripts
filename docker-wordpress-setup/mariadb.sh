#!/bin/bash

. env.sh

docker stop -t 10 ${NAME}wordpress-mariadb
docker rm -fv ${NAME}wordpress-mariadb

docker run --name ${NAME}wordpress-mariadb -d \
     --volumes-from ${NAME}wordpress-mariadb-volume \
     -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
     -e MYSQL_DATABASE=${MYSQL_USER} \
     -e MYSQL_USER=${MYSQL_USER} \
     -e MYSQL_PASSWORD=${MYSQL_PASSWORD} \
     --net ${OVERLAY_NETWORK} \
     --restart always \
     mariadb
