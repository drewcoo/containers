FROM jenkins/jenkins:lts

LABEL maintainer="drewcoo@gmail.com"

ENV JENKINS_HOME=/var/jenkins_home
ARG log_dir=/var/log/jenkins
# CHANGEME!!!
ARG user=jenkins
ARG password=jenkins

USER root
RUN mkdir $log_dir && \
    chown -R $user:$password $log_dir
USER $user

COPY ref/ /usr/share/jenkins/ref/
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV CASC_JENKINS_CONFIG $JENKINS_HOME/casc_configs/

USER root
RUN apt-get update -q && \
    apt-get install -yq \
      apt-utils \
      git \
      jq
USER $user

ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false -Dhudson.slaves.ChannelPinger.pingIntervalSeconds=120"
