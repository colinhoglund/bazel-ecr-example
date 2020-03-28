FROM gcr.io/cloud-marketplace-containers/google/bazel:2.2.0

ENV ECR_LOGIN_VERSION 0.4.0
ENV ECR_LOGIN_PATH /usr/local/bin/docker-credential-ecr-login

RUN wget -qO ${ECR_LOGIN_PATH} https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/${ECR_LOGIN_VERSION}/linux-amd64/docker-credential-ecr-login \
 && chmod +x ${ECR_LOGIN_PATH}

ADD config.json /root/.docker/config.json
ADD src/ /root/src/

WORKDIR /root/src/
