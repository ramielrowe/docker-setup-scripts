#!/bin/bash

#docker create --name plex-config-volume -v /config alpine /bin/sh
#cat plex-config-volume.tar.gz | docker cp - plex-config-volume:/

#docker run --rm \
#    --volumes-from plex-config-volume \
#    --entrypoint chown \
#    timhaak/plex:plexpass \
#    -R plex:plex /config

. run.sh
