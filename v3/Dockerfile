FROM python:3-alpine
ENV CONSUL_TEMPLATE_VERSION=0.14.0

RUN apk --update --no-cache add \
    bash \
    openssl-dev \
    openssl \
    ca-certificates \
    linux-headers \
    zeromq-dev \
    libevdev \
    libmemcached-dev \
    postgresql-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    zlib-dev \
    build-base \
    gettext \
    gettext

RUN cd /tmp && \
        wget https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
        unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
        mv consul-template /usr/local/bin/consul-template && \
        rm -f consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip
