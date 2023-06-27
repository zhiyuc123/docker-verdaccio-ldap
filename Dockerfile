FROM node:alpine
LABEL maintainer="https://github.com/zhiyuc123/docker-verdaccio-ldap"

ENV VERDACCIO_APPDIR=/opt/verdaccio \
    VERDACCIO_USER_NAME=verdaccio \
    VERDACCIO_USER_UID=10001 \
    VERDACCIO_PORT=4873 \
    VERDACCIO_PROTOCOL=http
ENV PATH=$VERDACCIO_APPDIR/docker-bin:$PATH \
    HOME=$VERDACCIO_APPDIR

WORKDIR $VERDACCIO_APPDIR

ADD app ./

ENV NODE_ENV=production

RUN npm install

RUN adduser -u $VERDACCIO_USER_UID -S -D -h $VERDACCIO_APPDIR -g "$VERDACCIO_USER_NAME user" -s /sbin/nologin $VERDACCIO_USER_NAME

USER $VERDACCIO_USER_UID

EXPOSE $VERDACCIO_PORT

VOLUME ["/verdaccio/storage", "/verdaccio/conf", "/verdaccio/plugins"]

CMD yarn verdaccio --config /verdaccio/conf/config.yaml --listen $VERDACCIO_PROTOCOL://0.0.0.0:$VERDACCIO_PORT
