#!/bin/bash

. env.sh

. build.sh

. create_volumes.sh

cat ${ENV_NAME}-etherpad.tar.gz | docker cp - ${ENV_NAME}_etherpad_volumes:/var/

. deploy.sh
