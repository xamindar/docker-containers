#!/bin/bash
. /usr/share/nvm/nvm.sh
export NVM_DIR="/home/.nvm"
cd /home/fxa-auth-server
nvm use 0.10
npm start &

