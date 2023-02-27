ARG AWS_BASE_VERSION

FROM registry.gitlab.com/gitlab-org/cloud-deploy/aws-base:${AWS_BASE_VERSION}
# docker build -t test . --no-cache --build-arg AWS_BASE_VERSION=v0.3.9

# Kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" \
    && echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

LABEL maintainer="Bread God (https://github.com/Vipcube)"
