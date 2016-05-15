#!/bin/bash

. env.sh

docker cp ${ENV_NAME}_etherpad_volumes:/var/etherpad - > ${ENV_NAME}-etherpad.tar.gz
