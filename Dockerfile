FROM circleci/ruby:2.4.5-node

ENV PATH $PATH:/usr/local/itms/bin

# Java versions to be installed
ENV JAVA_VERSION 8u131
ENV JAVA_DEBIAN_VERSION 8u131-b11-1~bpo8+1
ENV CA_CERTIFICATES_JAVA_VERSION 20161107~bpo8+1

# Needed for fastlane to work
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

USER root

# Update bundler
RUN gem install bundler:2.1.4

# iTMSTransporter needs java installed
RUN apt-get update \
  && apt-get install --yes \
    default-jdk-headless \
  && apt-get clean \
  && useradd -m builder

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre

RUN curl -sL https://firebase.tools | bash
RUN gem install fastlane -NV

USER builder

RUN mkdir -p /home/builder/workspace
ENV HOME /home/builder
RUN chmod a+rwx /home/builder
WORKDIR /home/builder/workspace