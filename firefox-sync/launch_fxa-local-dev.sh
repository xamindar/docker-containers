#!/bin/bash
. /usr/share/nvm/nvm.sh
export NVM_DIR="/home/.nvm"
cd /home/fxa-local-dev
nvm use 0.10
./pm2 kill
./pm2 start servers.json

