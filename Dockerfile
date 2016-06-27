#!/usr/bin/env docker

FROM phusion/baseimage:0.9.18
MAINTAINER Andy Ruck

ENV INITRD=No 
ENV TERM=dumb 
ENV MY_TZ=Europe/Berlin

RUN mkdir /tz && mv /etc/timezone /tz/ && mv /etc/localtime /tz/ \
 && ln -s /tz/timezone /etc/ && ln -s /tz/localtime /etc/

RUN echo $MY_TZ > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata 

RUN locale-gen en_US.UTF-8 && \
    apt-get update && DEBIAN_FRONTEND=noninteractive && \
    apt-get install -yq --no-install-recommends \
        git \
        curl  \
        wget && \

    apt-get autoclean && apt-get autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
