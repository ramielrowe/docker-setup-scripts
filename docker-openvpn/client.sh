#!/bin/bash
CLIENT="${1}"

. env.sh

docker run --volumes-from ${VOLUME_CONTAINER} --rm -it kylemanna/openvpn easyrsa build-client-full ${CLIENT} nopass
docker run --volumes-from ${VOLUME_CONTAINER} --rm kylemanna/openvpn ovpn_getclient ${CLIENT} > ${CLIENT}.ovpn
