#!/bin/bash

. env.sh

docker cp ${NAME}_jenkins_volumes:/var/jenkins_home - > jenkins_home.tar.gz
