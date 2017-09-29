FROM python:latest

ENV PIPENV_VENV_IN_PROJECT=1
ENV CONSUL_TEMPLATE_VERSION=0.19.3

RUN pip install -U pip pipenv && \
    cd /tmp && \
    wget https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz && \
    tar xzf consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz && \
    mv consul-template /usr/local/bin/consul-template && \
    rm -f consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz
