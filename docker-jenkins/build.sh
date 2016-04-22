#!/bin/bash

. env.sh

docker pull jenkins
docker build -t ${NAME}_jenkins .
