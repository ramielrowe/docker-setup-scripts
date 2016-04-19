#!/bin/bash

. env.sh

docker stop -t 5 ${APP_CONTAINER}

docker cp ${DATA_CONTAINER}:/etc/logrotate.d - > logrotate.d.tar.gz
docker cp ${DATA_CONTAINER}:/etc/nginx - > nginx.tar.gz
docker cp ${DATA_CONTAINER}:/opt/graphite/conf - > graphite.conf.tar.gz
docker cp ${DATA_CONTAINER}:/opt/graphite/storage - > graphite.storage.tar.gz
docker cp ${DATA_CONTAINER}:/opt/statsd - > statsd.tar.gz
docker cp ${DATA_CONTAINER}:/var/log - > log.tar.gz

docker start ${APP_CONTAINER}
