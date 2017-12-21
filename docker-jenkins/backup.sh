#!/bin/bash

. env.sh

docker cp ${NAME}_jenkins_volumes:/var/jenkins_home - > ${NAME}_jenkins.tar.gz
