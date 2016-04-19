#!/bin/bash

. env.sh

docker stop -t 10 quassel quassel-postgres
docker rm -fv quassel quassel-postgres

docker run --name quassel-postgres -d \
    --volumes-from quassel-postgres-volume \
    -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
    -e POSTGRES_USER=quassel \
    --restart always \
    --net $OVERLAY_NETWORK \
    postgres:9.4

docker run --name quassel -d \
    --volumes-from quassel-volume \
    -p 4242:4242 \
    --restart always \
    --net $OVERLAY_NETWORK \
    clue/quassel-core
