#!/usr/bin/env docker

FROM phusion/baseimage
MAINTAINER Andy Ruck mychiara+docker at gmail com

ENV DEBIAN_FRONTEND=noninteractive \
        INITRD=No \
        TERM=dumb \
        MY_TZ=Europe/Berlin

RUN rm /etc/timezone && echo $MY_TZ >> /etc/timezone && \
    locale-gen en_US.UTF-8 && \
    apt-get update && \
    apt-get install -yq --no-install-recommends \
        build-essential \
        software-properties-common \
        git \
        curl  \
        wget \
        zsh && \

    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \

    chsh -s $(which zsh) && \
    apt-get autoclean && apt-get autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
