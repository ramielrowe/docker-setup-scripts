#!/bin/bash

. env.sh

. create_volumes.sh

docker stop -t 5 ${ENV_NAME}_etherpad
docker rm -fv ${ENV_NAME}_etherpad

docker run -d --name ${ENV_NAME}_etherpad \
    --restart always \
    --net ${OVERLAY_NETWORK} \
    --volumes-from ${ENV_NAME}_etherpad_volumes \
    --label com.apmelton.webhead.publish=true \
    --label com.apmelton.webhead.icc=true \
    --label com.apmelton.webhead.domain=${DOMAIN_NAME} \
    --label com.apmelton.webhead.default=false \
    ${ENV_NAME}_etherpad

. nginx_head.sh
