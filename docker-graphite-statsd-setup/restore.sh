#!/bin/bash

. env.sh

. create_volumes.sh

cat logrotate.d.tar.gz | docker cp - ${DATA_CONTAINER}:/etc/
cat nginx.tar.gz | docker cp - ${DATA_CONTAINER}:/etc/
cat graphite.conf.tar.gz | docker cp - ${DATA_CONTAINER}:/opt/graphite/
cat graphite.storage.tar.gz | docker cp - ${DATA_CONTAINER}:/opt/graphite/
cat statsd.tar.gz | docker cp - ${DATA_CONTAINER}:/opt/
cat log.tar.gz | docker cp - ${DATA_CONTAINER}:/var/

. run.sh
