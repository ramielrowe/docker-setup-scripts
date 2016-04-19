#!/bin/bash

. env.sh

docker stop -t 10 ${NAME}wordpress ${NAME}wordpress-mariadb ${NAME}wordpress-mariadb-volume ${NAME}wordpress-volume
docker rm -fv ${NAME}wordpress ${NAME}wordpress-mariadb ${NAME}wordpress-mariadb-volume ${NAME}wordpress-volume
