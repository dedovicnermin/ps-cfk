FROM ubuntu:18.04
ENV CONFLUENT_CLI_VERSION=3.20.0

RUN apt-get update -y && apt-get install -y sudo git

RUN echo "buildkite-agent ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd -m buildkite-agent
RUN echo "buildkite-agent:buildkite-agent" | chpasswd
RUN adduser buildkite-agent sudo
WORKDIR /home/buildkite-agent
USER buildkite-agent

RUN sudo chown -R $(whoami) /usr/local/bin

RUN sudo apt-get update -y && sudo apt-get install -y \
    jq \
    curl \
    grep \
    unzip \
    lsb-release \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    maven \
    pass



RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN sudo apt-get update -y && sudo apt-get install docker-ce docker-ce-cli containerd.io -y

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash


# Install Confluent Cloud CLI
RUN curl -sL --http1.1 https://cnfl.io/cli | sh -s -- v${CONFLUENT_CLI_VERSION}


RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl ; chmod +x ./kustomize
#RUN cp kubectl ./bin/kubectl; cp kustomize ./bin/kustomize
RUN cp kubectl /usr/local/bin/kubectl; cp kustomize /usr/local/bin/kustomize

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3; chmod 700 get_helm.sh; ./get_helm.sh;


ENV PATH "./bin:$PATH"

RUN kubectl version --short --client
RUN kustomize version



VOLUME ["/home/buildkite-agent/.m2"]

CMD ["sleep", "infinity"]
