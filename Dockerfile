FROM alpine:3.17.2

# Base Tools
RUN apk update \
    && apk fix \
    && apk add bash wget curl groff jq less unzip zip

# Git
RUN apk add git git-lfs gpg less openssh patch \
    && git lfs install

# Docker
RUN apk add docker docker-cli-compose

# Kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# Helm
ENV HELM_BASE_URL="https://get.helm.sh"
ENV HELM_VERSION=3.9.4

RUN wget ${HELM_BASE_URL}/helm-v${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64

RUN chmod +x /usr/bin/helm

# AWS
RUN apk add aws-cli

# Remove cache
RUN rm -rf /var/cache/apk/*

LABEL maintainer="Bread God (https://github.com/Vipcube)"
