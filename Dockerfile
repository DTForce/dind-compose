FROM docker:17

ENV \
    BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl py-pip tar bash"

RUN \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps

RUN  pip install 'docker-compose==1.8.0'
