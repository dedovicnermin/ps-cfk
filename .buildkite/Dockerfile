FROM ubuntu:18.04
ENV CONFLUENT_CLI_VERSION=3.20.0

RUN apt-get update -y && apt-get install -y \
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



RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update -y && apt-get install docker-ce docker-ce-cli containerd.io -y

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash


# Install Confluent Cloud CLI
RUN curl -sL --http1.1 https://cnfl.io/cli | sh -s -- v${CONFLUENT_CLI_VERSION}


RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl ; chmod +x ./kustomize
RUN cp kubectl ./bin/kubectl; cp kustomize ./bin/kustomize

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3; chmod 700 get_helm.sh; ./get_helm.sh;


ENV PATH "./bin:$PATH"
RUN kubectl version --short --client
RUN kustomize version



VOLUME ["/root/.m2"]

CMD ["sleep", "infinity"]
