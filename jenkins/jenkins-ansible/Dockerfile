FROM jenkins/jenkins

USER root 

RUN apt-get -y update
RUN apt-get -y install python3 python3-pip

RUN pip3 install ansible --upgrade

USER jenkins
