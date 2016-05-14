#!/bin/bash

. env.sh

. read_only.sh

docker cp ${NAME}wordpress-volume:/var/www/html - > ${NAME}wordpress.tar.gz

docker cp ${NAME}wordpress-mariadb-volume:/var/lib/mysql - > ${NAME}wordpress-mariadb.tar.gz

. unread_only.sh
