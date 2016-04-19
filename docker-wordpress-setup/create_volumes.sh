#!/bin/bash

. env.sh

docker create --name ${NAME}wordpress-volume \
    -v /var/www/html \
    cirros

docker create --name ${NAME}wordpress-mariadb-volume \
    -v /var/lib/mysql \
    cirros
