# Docker Image CLI with AWS, K8S

The hardest container image to find on public repositories is the one I want, but it always seems to be missing a part.
Therefore, I decided to build it myself. :sunglasses:

This image base on `alpine`, and packs the [git](https://git-scm.com/), [Kubectl](https://kubernetes.io/docs/tasks/tools/) together with the [Helm](https://helm.sh/docs/intro/install/).

## Why we need it

Mostly it is used during CI/CD (continuous integration and continuous delivery) or as part of an automated build/deployment with with Amazon ECR and EKS.

## NOTES

The latest docker tag is the latest release version

Please avoid to use `latest` tag for any production deployment.
Tag with right version is the proper way, such as `vipcube/dockercli-with-aws-k8s-helm:v0.3.1`.

## Additional Infos

### GitHub Repo

[https://github.com/Vipcube/dockercli-with-aws-k8s-helm](https://github.com/Vipcube/dockercli-with-aws-k8s-helm)

### Docker Image Tags

[https://hub.docker.com/r/vipcube/dockercli-with-aws-k8s-helm/tags](https://hub.docker.com/r/vipcube/dockercli-with-aws-k8s-helm/tags)

## Usage

```shell
# run container as git command
docker run -it vipcube/dockercli-with-aws-k8s-helm git

# run container as docker command
docker run -it vipcube/dockercli-with-aws-k8s-helm docker

# run container as aws command
docker run -it vipcube/dockercli-with-aws-k8s-helm aws

# run container as kubectl command
docker run -it vipcube/dockercli-with-aws-k8s-helm kubectl

# run container as helm command
docker run -it vipcube/dockercli-with-aws-k8s-helm helm
```

## Authors

maintain by: [@Vipcube](https://github.com/Vipcube)
