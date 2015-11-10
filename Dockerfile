#!/usr/bin/env docker

FROM phusion/baseimage:0.9.17
MAINTAINER Andy Ruck mychiara+docker at gmail com

ENV INITRD=No \
        TERM=dumb \
        MY_TZ=Europe/Berlin

RUN rm /etc/timezone && echo $MY_TZ >> /etc/timezone && \
    locale-gen en_US.UTF-8 && \
    apt-get update && DEBIAN_FRONTEND=noninteractive && \
    apt-get install -yq --no-install-recommends \
        git \
        curl  \
        wget && \

    apt-get autoclean && apt-get autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
