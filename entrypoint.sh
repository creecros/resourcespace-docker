#!/bin/sh

USER=dockeruser
VOLUME=/include
VOLUME2=/filestore
UID="$(stat -c '%u' $VOLUME)" && \
UID="$(stat -c '%u' $VOLUME2)" && \
useradd --uid "$UID" "$USER" && \
ls -l "$VOLUME" && \
ls -l "$VOLUME2" && \
exec gosu "$USER" "$@"
