#!/bin/bash

. /usr/share/nvm/nvm.sh
export NVM_DIR="/home/.nvm"
nvm install 0.10
npm config set python python2.7

cd /home
git clone git://github.com/mozilla/fxa-auth-server.git
cd fxa-auth-server
npm i --python=python2.7

## Manual install of ffsync content server
cd /home
git clone git://github.com/mozilla/fxa-local-dev.git
cd fxa-local-dev
npm i --python=python2.7


