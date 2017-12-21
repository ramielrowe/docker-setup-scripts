#!/bin/bash

. env.sh

docker stop -t 10 ${NAME}
docker rm -fv ${NAME}

docker run -d --name ${NAME} \
    --restart always \
    --net ${OVERLAY_NETWORK} \
    -e "NEW_URL=${DEST_URL}" \
    --label com.apmelton.webhead.publish=true \
    --label com.apmelton.webhead.icc=true \
    --label com.apmelton.webhead.icc.port=5000 \
    --label com.apmelton.webhead.domain=${SOURCE_DOMAIN} \
    --label com.apmelton.webhead.default=false \
    ramielrowe/redirect

. nginx_head.sh
