#!/bin/bash

. vpn.env

if [ -z "$(docker ps -aq --filter name=openvpn-client-volumes)" ]; then
    docker create -v /vpn --name openvpn-client-volumes alpine /bin/sh
fi

docker cp ${VPN_CONFIG} openvpn-client-volumes:/vpn/vpn.conf
docker cp vpn.auth openvpn-client-volumes:/vpn/vpn.auth

docker rm -fv openvpn-client
docker run -d \
    --cap-add=NET_ADMIN \
    --device /dev/net/tun \
    --name openvpn-client \
    --volumes-from openvpn-client-volumes \
    dperson/openvpn-client \
    -d
