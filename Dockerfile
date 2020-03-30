FROM python:3.8-slim

ENV BAZELISK_VERSION v1.3.0
ENV BAZELISK_PATH /usr/local/bin/bazel

ENV ECR_LOGIN_VERSION 0.4.0
ENV ECR_LOGIN_PATH /usr/local/bin/docker-credential-ecr-login

RUN apt-get update && apt-get install -y wget git g++ unzip zip \
 && wget -qO ${BAZELISK_PATH} https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-amd64 \
 && chmod +x ${BAZELISK_PATH} \
 && wget -qO ${ECR_LOGIN_PATH} https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/${ECR_LOGIN_VERSION}/linux-amd64/docker-credential-ecr-login \
 && chmod +x ${ECR_LOGIN_PATH}

ADD config.json /root/.docker/config.json
ADD src/ /root/src/

WORKDIR /root/src/
ENTRYPOINT ["bazel"]
