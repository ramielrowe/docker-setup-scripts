#!/bin/bash

. env.sh

docker stop -t 0 ${NAME}_jenkins
docker rm -fv ${NAME}_jenkins ${NAME}_jenkins_volumes

docker create --name ${NAME}_jenkins_volumes \
    -v /var/jenkins_home \
    ${NAME}_jenkins

. deploy.sh
