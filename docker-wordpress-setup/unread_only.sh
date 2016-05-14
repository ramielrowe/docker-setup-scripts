#!/bin/bash

. env.sh

docker run --rm \
     -e MYSQL_SERVER=${NAME}wordpress-mariadb \
     -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
     -e MYSQL_DATABASE=$MYSQL_USER \
     --net $OVERLAY_NETWORK \
     mariadb \
     sh -c 'exec mysql -h"$MYSQL_SERVER" -P 3306 -u root -p"$MYSQL_ROOT_PASSWORD" -e "SET GLOBAL read_only = OFF;UNLOCK TABLES;"'
