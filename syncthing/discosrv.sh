#!/bin/bash
#start discosrv using environment variables
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!! STARTING DISCOVERY SERVER !!!!!!!!!!!!!!!!"
echo "use instructions: http://docs.syncthing.net/users/discosrv.html" 
/opt/discosrv/discosrv -cert="$SYNCTHING_CONFIG/discosrv/cert.pem" -key="$SYNCTHING_CONFIG/discosrv/key.pem" -stats-file="$SYNCTHING_CONFIG/discosrv/stats.log"

