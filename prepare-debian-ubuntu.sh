#!/bin/sh
# Prepare CI system by installing all required dependencies/tools
# For Debian/Ubuntu Systems
# May(Mostly) requires SUDO powers
#
# Copyright (c) 2015 Gocho Mugo <mugo@forfuture.co.ke>


# add repositories
ionicCi_add_repos() {
  add-apt-repository --yes ppa:chris-lea/node.js
  add-apt-repository --yes ppa:upubuntu-com/sdk
  apt-get update --yes
}


# install the required dependencies/tools
ionicCi_install_requirements() {
  apt-get install --yes openjdk-7-jdk
  apt-get install --yes python python-software-properties
  apt-get install --yes nodejs
  npm -g install cordova ionic bower gulp cordova-gen
  [ -d node_modules/ ] || npm install
  [ -d bower_components/ ] || bower install
}


# install ADT
ionicCi_install_adt() {
  apt-get install --yes lib32z1 lib32stdc++6
  apt-get install --yes android-sdk
  ANDROID_TOOLS=$(dirname $(which android))
  ANDROID_HOME=$(dirname ${ANDROID_TOOLS})
  export ANDROID_HOME
  export PATH=${ANDROID_HOME}/platform-tools:${PATH}
  export PATH=${ANDROID_TOOLS}:${PATH}
}


# logging to console
#
# ${1} -- message to log
ionicCi_log() {
  echo "[ionic-ci]:    ${1}"
}


# starting build
ionicCi_log "adding repositories"
ionicCi_add_repos
ionicCi_log "installing requirements"
ionicCi_install_requirements
ionicCi_log "installing Android Development Kit"
ionicCi_install_adt
ionicCi_log "environment ready for ionic building"
