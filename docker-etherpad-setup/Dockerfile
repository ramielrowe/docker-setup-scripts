FROM node:5-wheezy

VOLUME /var/etherpad

RUN apt-get update && apt-get install gzip git curl python libssl-dev pkg-config build-essential -y

RUN git clone https://github.com/ether/etherpad-lite /root/etherpad-lite
WORKDIR /root/etherpad-lite
RUN npm install sqlite3 ep_small_list --save
ADD settings.json /root/etherpad-lite

EXPOSE 80
ENTRYPOINT ["/root/etherpad-lite/bin/run.sh", "--root"]
