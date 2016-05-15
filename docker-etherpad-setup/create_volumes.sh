#!/bin/bash

. env.sh

if [ -z "$(docker ps -aq --filter name=${ENV_NAME}_etherpad_volumes)" ]; then
    docker create --name ${ENV_NAME}_etherpad_volumes \
        ${ENV_NAME}_etherpad
fi
