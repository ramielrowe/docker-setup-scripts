#!/bin/bash

. env.sh

if [ -z "$(docker ps -aq --filter name=plex-config-volume)" ]; then
    docker create --name plex-config-volume -v /config alpine /bin/sh
fi

docker pull timhaak/plex

docker kill -s int plex-app
docker stop -t 5 plex-app
docker rm -fv plex-app

docker run -d --name plex-app \
    --restart always \
    --volumes-from plex-config-volume \
    -v /media/nas-01_media:/media/nas-01_media \
    --net host \
    -e PLEX_USERNAME=${PLEX_USERNAME} \
    -e PLEX_PASSWORD=${PLEX_PASSWORD} \
    -e PLEX_EXTERNALPORT=${PLEX_EXTERNALPORT} \
    timhaak/plex

