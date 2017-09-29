FROM python:3-alpine

ENV PIPENV_VENV_IN_PROJECT=1
ENV CONSUL_TEMPLATE_VERSION=0.19.3

RUN apk --update --no-cache add \
    bash \
    openssl-dev \
    openssl \
    ca-certificates \
    linux-headers \
    zeromq-dev \
    libevdev \
    libffi-dev \
    libmemcached-dev \
    postgresql-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    zlib-dev \
    build-base \
    gettext-dev \
    libxslt-dev \
    git && \
    pip install -U pip pipenv && \
    cd /tmp && \
    wget https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mv consul-template /usr/local/bin/consul-template && \
    rm -f consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip
