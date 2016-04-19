#!/bin/bash

. env.sh

. create_volumes.sh

docker stop -t 5 ${APP_CONTAINER}
docker rm -fv ${APP_CONTAINER}

docker run -d --name ${APP_CONTAINER} \
    --restart always \
    -p 8080:80 \
    -p 2003-2004:2003-2004 \
    -p 2023-2024:2023-2024 \
    -p 8125:8125/udp \
    -p 8126:8126 \
    --volumes-from ${DATA_CONTAINER} \
    ${IMAGE}
