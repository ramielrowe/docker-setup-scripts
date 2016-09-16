#!/bin/bash

. deluge.env

if [ -z "$(docker ps -aq --filter name=deluge-volumes)" ]; then
    docker create -v /config --name deluge-volumes alpine /bin/sh
fi

docker rm -fv deluge deluge-web

docker run -d \
    --name deluge \
    --net container:openvpn-client \
    --volumes-from deluge-volumes \
    -v ${DOWNLOADS_DIR}:/downloads \
    linuxserver/deluge

docker run -d \
    --name deluge-web \
    -p 8112:80 \
    --link openvpn-client:deluge \
    dperson/nginx \
    -w "http://deluge:8112/;/"
