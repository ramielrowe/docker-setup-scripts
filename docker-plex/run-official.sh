#!/bin/bash

. env.sh

if [ -z "$(docker ps -aq --filter name=plex-config-volume)" ]; then
    docker create --name plex-config-volume -v /config alpine /bin/sh
fi

docker pull plexinc/pms-docker:plexpass

docker kill -s int plex-app
docker stop -t 5 plex-app
docker rm -fv plex-app

docker run \
    -d \
    --name plex-app \
    --restart always \
    --net host \
    -e TZ="America/New_York" \
    -e PLEX_CLAIM="claim-sX541x3RFxGdkzYSWFxp" \
    -e ADVERTISE_IP="https://172.16.0.206:32400" \
    --volumes-from plex-config-volume \
    -v /var/plex/transcode:/transcode \
    -v /media/nas-01_media:/media/nas-01_media \
    plexinc/pms-docker:plexpass

