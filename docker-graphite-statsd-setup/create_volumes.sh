#!/bin/bash

. env.sh

if [ -z "$(docker ps -aq --filter name=${DATA_CONTAINER})" ]; then
  docker create --name ${DATA_CONTAINER} ${IMAGE}
fi
