if [ -z "$(docker ps -aq --filter name=smartthings-mqtt-volume)" ]; then
    docker create --name smartthings-mqtt-volume \
        -v /db \
        -v /config \
        alpine /bin/sh
fi


if [ -z "$(docker ps -aq --filter name=smartthings-mqtt-broker)" ]; then
    docker run -d --name smartthings-mqtt-broker \
        --restart always \
        --volumes-from smartthings-mqtt-volume \
        -p 1883:1883 \
        matteocollina/mosca
fi

if [ -z "$(docker ps -aq --filter name=smartthings-mqtt-bridge)" ]; then
    docker run -d --name smartthings-mqtt-bridge \
        --restart always \
        --volumes-from smartthings-mqtt-volume \
        -p 45001:8080 \
        stjohnjohnson/smartthings-mqtt-bridge
fi
