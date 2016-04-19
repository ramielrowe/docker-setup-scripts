#!/bin/bash

. env.sh

docker stop -t 10 ${NAME}wordpress ${NAME}wordpress-mariadb
docker rm -fv ${NAME}wordpress ${NAME}wordpress-mariadb

. mariadb.sh

sleep 10

. web.sh
