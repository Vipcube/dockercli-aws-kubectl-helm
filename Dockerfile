FROM alpine:3.17.2

# Base Tools
RUN apk update \
    && apk fix \
    && apk add bash wget curl groff jq less unzip zip openssl

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
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# AWS
RUN apk add aws-cli

# Remove cache
RUN rm -rf /var/cache/apk/*

LABEL maintainer="Bread God (https://github.com/Vipcube)"
