#!/bin/bash

. env.sh

docker cp quassel-postgres-volume:/var/lib/postgresql/data - > postgres.tar.gz
docker cp quassel-volume:/var/lib/quassel - > quassel.tar.gz
