#!/bin/bash

. env.sh

docker stop -t 0 ${NAME}_jenkins
docker rm -fv ${NAME}_jenkins

docker run -d --name ${NAME}_jenkins \
    --restart always \
    --volumes-from ${NAME}_jenkins_volumes \
    --net $OVERLAY_NETWORK \
    --label com.apmelton.webhead.publish=true \
    --label com.apmelton.webhead.icc=true \
    --label com.apmelton.webhead.icc.port=8080 \
    --label com.apmelton.webhead.domain=${DOMAIN_NAME} \
    --label com.apmelton.webhead.default=false \
    ${NAME}_jenkins

. nginx_head.sh
