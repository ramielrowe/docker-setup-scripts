if [ -z "$(docker ps -aq --filter name=home-assistant-volume)" ]; then
    docker create --name home-assistant-volume -v /config alpine /bin/sh
fi

docker kill -s int home-assistant
docker stop -t 5 home-assistant
docker rm -fv home-assistant

docker run -d --name home-assistant \
    --restart always \
    --volumes-from home-assistant-volume \
    -v /etc/localtime:/etc/localtime:ro \
    --net host \
    -p 49080:8123 \
    homeassistant/home-assistant
