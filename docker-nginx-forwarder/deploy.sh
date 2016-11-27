if [ -z "$(docker ps -aq --filter name=nginx-forwarder-volumes)" ]; then
    docker create --name nginx-forwarder-volumes -v /etc/nginx alpine /bin/sh
fi

docker cp nginx.conf nginx-forwarder-volumes:/etc/nginx/nginx.conf

docker kill -s int nginx-forwarder
docker stop -t 5 nginx-forwarder
docker rm -fv nginx-forwarder

docker run -d --name nginx-forwarder \
    --restart always \
    --volumes-from nginx-forwarder-volumes \
    -p 8081:80 \
    nginx
