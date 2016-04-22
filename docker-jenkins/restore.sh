#!/bin/bash

. env.sh

docker create --name ${NAME}_jenkins_volumes \
    -v /var/jenkins_home \
    ${NAME}_jenkins

cat jenkins_home.tar.gz | docker cp - ${NAME}_jenkins_volumes:/var
docker run --rm --volumes-from ${NAME}_jenkins_volumes --user 0 --entrypoint chown ${NAME}_jenkins -R jenkins /var/jenkins_home

. deploy.sh
