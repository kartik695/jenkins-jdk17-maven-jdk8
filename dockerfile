     



#FROM jenkins/jenkins:latest

#USER root

#RUN apt-get update -y && \
#    apt-get install wget -y && \
#    wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public |  apt-key add - && \
#    echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list && \
#    apt-get update -y && \
#    apt-get install temurin-8-jdk -y && \
#    wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
#    tar -zxvf apache-maven-3.3.9-bin.tar.gz -C /opt && \
#    apt-get install vim -y && \
#    echo 'export JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64' >> ~/.bashrc && \
#    echo 'export M2_HOME=/opt/apache-maven-3.3.9' >> ~/.bashrc && \
#    echo 'export PATH=$M2_HOME/bin:$JAVA_HOME/bin:$PATH' >> ~/.bashrc



  




FROM jenkins/jenkins:latest

USER root

RUN apt-get update -y && \
    apt-get install wget curl -y && \
    wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | apt-key add - && \
    echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y temurin-8-jdk && \
    wget -O /tmp/apache-maven-3.3.9-bin.tar.gz https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar -zxvf /tmp/apache-maven-3.3.9-bin.tar.gz -C /opt && \
    rm /tmp/apache-maven-3.3.9-bin.tar.gz && \
    apt-get install vim -y && \
    echo 'export JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64' >> ~/.bashrc && \
    echo 'export M2_HOME=/opt/apache-maven-3.3.9' >> ~/.bashrc && \
    echo 'export PATH=$M2_HOME/bin:$JAVA_HOME/bin:$PATH' >> ~/.bashrc








