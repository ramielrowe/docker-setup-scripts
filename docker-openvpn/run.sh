#!/bin/bash

. env.sh

if [ -z "$(docker ps -aq --filter name=${VOLUME_CONTAINER})" ]; then
    VPN_HOST_CONSTRAINT=""
    if [ -n "${VPN_HOST}" ]; then
        VPN_HOST_CONSTRAINT="-e constraint:node==${VPN_HOST}"
    fi

    docker create --name ${VOLUME_CONTAINER} \
        -v /etc/openvpn alpine \
        ${VPN_HOST_CONSTRAINT} \
        /bin/sh

    docker run --rm \
        --volumes-from ${VOLUME_CONTAINER} \
        kylemanna/openvpn \
        ovpn_genconfig -u udp://${DOMAIN_NAME}:${VPN_PORT}

    docker run --rm -it \
        --volumes-from ${VOLUME_CONTAINER} \
        kylemanna/openvpn \
        ovpn_initpki
fi

docker stop -t 10 ${APP_CONTAINER}
docker rm -fv ${APP_CONTAINER}

docker run -d --name ${APP_CONTAINER} \
    --volumes-from ${VOLUME_CONTAINER} \
    -p ${VPN_PORT}:1194/udp \
    --cap-add NET_ADMIN \
    -e DEBUG=1 \
    kylemanna/openvpn

. client.sh ${INITIAL_CLIENT}
