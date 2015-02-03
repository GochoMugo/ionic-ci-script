#!/bin/sh
# Prepare CI system by installing all required dependencies/tools
# For Debian/Ubuntu Systems
# May(Mostly) requires SUDO powers
#
# Copyright (c) 2015 Gocho Mugo <mugo@forfuture.co.ke>


# add repositories
ionicCi_add_repos() {
  add-apt-repository --yes ppa:chris-lea/node.js
  apt-get update --yes
}


# install the required dependencies/tools
ionicCi_install_requirements() {
  apt-get install --yes python python-software-properties
  apt-get install --yes nodejs
  npm -g install cordova ionic bower gulp cordova-gen
  [ -d node_modules/ ] || npm install
  [ -d bower_components/ ] || bower install
}


# install ADT
ionicCi_install_adt() {
  wget https://raw.githubusercontent.com/GochoMugo/android-sdk-installer/master/android-sdk-installer.sh
  sudo bash android-sdk-installer.sh --yes --no-color --dir=./android-sdk
}


# logging to console
#
# ${1} -- message to log
ionicCi_log() {
  echo "[ionic-ci]:    ${1}"
}


# export environment variables
ionicCi_export_vars() {
  # for android sdk
  source env.sh
}


# processing options passed to script
if [ ${1} == '--env' ] ; then
  ionicCi_log "exporting variables to environment"
  ionicCi_export_vars
  ionicCi_log "done with exporting!"
else
  # starting build
  ionicCi_log "adding repositories"
  ionicCi_add_repos
  ionicCi_log "installing requirements"
  ionicCi_install_requirements
  ionicCi_log "installing Android Development Kit"
  ionicCi_install_adt
  ionicCi_log "done with installing!"
fi
