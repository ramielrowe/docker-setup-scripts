#!/bin/bash

random_string() {
    cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1
}

cat > env.sh << END_ENV_SH
NAME=www-example-
MYSQL_ROOT_PASSWORD=$(random_string)
MYSQL_USER=wordpress
MYSQL_PASSWORD=$(random_string)
WORDPRESS_AUTH_KEY=$(random_string)
WORDPRESS_SECURE_AUTH_KEY=$(random_string)
WORDPRESS_LOGGED_IN_KEY=$(random_string)
WORDPRESS_NONCE_KEY=$(random_string)
WORDPRESS_AUTH_SALT=$(random_string)
WORDPRESS_SECURE_AUTH_SALT=$(random_string)
WORDPRESS_LOGGED_IN_SALT=$(random_string)
WORDPRESS_NONCE_SALT=$(random_string)
OVERLAY_NETWORK=www_overlay
DOMAIN_NAME=www.example.com
END_ENV_SH
