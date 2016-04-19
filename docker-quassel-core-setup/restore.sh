#!/bin/bash

. env.sh

docker create --name quassel-volume \
    clue/quassel-core


docker create --name quassel-postgres-volume \
    -v /var/lib/postgresql/data \
    cirros

cat postgres.tar.gz | docker cp - quassel-postgres-volume:/var/lib/postgresql/
cat quassel.tar.gz | docker cp - quassel-volume:/var/lib/

docker run --rm -ti \
    --volumes-from quassel-postgres-volume \
    --user 0 \
    --entrypoint /bin/bash \
    postgres \
    -c "chown -R postgres:postgres /var/lib/postgresql"

docker run --rm -ti \
    --volumes-from quassel-volume \
    --user 0 \
    --entrypoint /bin/bash \
    clue/quassel-core \
    -c "chown -R quasselcore /var/lib/quassel"

. apps.sh
