# Base 
An opinionated base image for docker container which extends the phusion/baseimage to be able to facilitate runit and all the nice features build into that.

## Environment variables
It sets some basic environment variables:

* ~~DEBIAN_FRONTEND=noninteractive~~ not setting that anymore [see #4032](https://github.com/docker/docker/issues/4032)
* INITRD=No
* TERM=dumb 
* MY_TZ=Europe/Berlin

The var $MY_TZ is used to update the images' timezone file - who would of guessed :], the others are ubuntu specific.

## Packages
Preinstalling the following packages:

* git 
* curl
* wget



