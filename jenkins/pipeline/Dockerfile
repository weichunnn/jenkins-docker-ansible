FROM jenkins/jenkins

USER root

# to install python3 and pip3 needed for ansible
RUN apt-get -y update
RUN apt-get -y install python3 python3-pip

RUN pip3 install ansible --upgrade

# install docker
RUN apt-get -y update
RUN apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \ 
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
apt-get update && \
apt-get -y install docker-ce docker-ce-cli containerd.io

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins
