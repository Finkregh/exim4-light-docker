# use ubuntu as base
FROM ubuntu:12.04

MAINTAINER Oluf Lorenzen, <finkregh@mafia-server.net>

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && apt-get -qy update

# update package cache, upgrade system
RUN apt-get -qy update
RUN apt-get upgrade -y

# install/configure languages/locales
RUN apt-get -qy install language-pack-en 

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

# add dpkg-configfile for debconf
ADD var/cache/debconf/config.dat /var/tmp/debconf-exim4-config.dat

# install exim4-light
#RUN apt-get -qy install exim4-daemon-light
RUN cat /var/tmp/debconf-exim4-config.dat | DEBCONF_FRONTEND=noninteractive DEBCONF_DB_FALLBACK=Pipe apt-get -qy install exim4-daemon-light

# add start-script
ADD docker-bin/start-exim /usr/local/bin/start-exim
RUN chmod +x /usr/local/bin/start-exim

# enable access via tcp/25 (SMTP)
EXPOSE 25

#ENTRYPOINT /usr/local/bin/start-exim
