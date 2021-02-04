FROM mcr.microsoft.com/azure-pipelines/vsts-agent:ubuntu-16.04-docker-18.06.1-ce-standard
MAINTAINER ryanhs <mr.ryansilalahi@gmail.com>

# install some tools
RUN apt update && apt install -y git less curl nano
RUN alias vi=nano
RUN alias vim=nano

# yq
RUN wget https://github.com/mikefarah/yq/releases/download/3.3.0/yq_linux_amd64
RUN chmod +x yq_linux_amd64
RUN sudo mv yq_linux_amd64 /usr/local/bin/yq

# install kubectl
RUN mkdir -p ~/.kube

# install npm tools
RUN sudo npm i -g yaml-cli
RUN sudo npm i -g tree-cli
RUN sudo npm i -g envsub

# aws cli
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# helm
RUN wget https://get.helm.sh/helm-v3.2.1-linux-amd64.tar.gz
RUN tar -xvzf helm-v3.2.1-linux-amd64.tar.gz
RUN mv linux-amd64/helm /usr/local/bin/helm

# gcloud
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-318.0.0-linux-x86_64.tar.gz
RUN tar xvzf google-cloud-sdk-318.0.0-linux-x86_64.tar.gz
RUN chmod +x ./google-cloud-sdk/install.sh
RUN ./google-cloud-sdk/install.sh --quiet
ENV PATH=$PATH:/vsts/google-cloud-sdk/bin
