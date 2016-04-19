#!/bin/bash

. env.sh

docker run --name ${NAME}wordpress -d \
    --volumes-from ${NAME}wordpress-volume \
    -e WORDPRESS_DB_HOST=${NAME}wordpress-mariadb \
    -e WORDPRESS_DB_USER=$MYSQL_USER \
    -e WORDPRESS_DB_PASSWORD=$MYSQL_PASSWORD \
    -e WORDPRESS_DB_NAME=$MUSQL_USER \
    -e WORDPRESS_AUTH_KEY=$WORDPRESS_AUTH_KEY \
    -e WORDPRESS_SECURE_AUTH_KEY=$WORDPRESS_SECURE_AUTH_KEY \
    -e WORDPRESS_LOGGED_IN_KEY=$WORDPRESS_LOGGED_IN_KEY \
    -e WORDPRESS_NONCE_KEY=$WORDPRESS_NONCE_KEY \
    -e WORDPRESS_AUTH_SALT=$WORDPRESS_AUTH_SALT \
    -e WORDPRESS_SECURE_AUTH_SALT=$WORDPRESS_SECURE_AUTH_SALT \
    -e WORDPRESS_LOGGED_IN_SALT=$WORDPRESS_LOGGED_IN_SALT \
    -e WORDPRESS_NONCE_SALT=$WORDPRESS_NONCE_SALT \
    --net $OVERLAY_NETWORK \
    --label com.apmelton.webhead.publish=true \
    --label com.apmelton.webhead.icc=true \
    --label com.apmelton.webhead.domain=${DOMAIN_NAME} \
    --label com.apmelton.webhead.default=false \
    --restart always \
    wordpress
