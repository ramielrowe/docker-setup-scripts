#!/bin/bash

. env.sh

docker create --name quassel-volume \
    clue/quassel-core

docker create --name quassel-postgres-volume \
    -v /var/lib/postgresql/data \
    cirros
