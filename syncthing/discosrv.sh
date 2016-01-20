#!/bin/bash
#start discosrv using environment variables
echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n!!!!!!!!!!!!!!!! STARTING DISCOVERY SERVER !!!!!!!!!!!!!!!!\nuse instructions: http://docs.syncthing.net/users/discosrv.html\nModify the following Discovery server URL accordingly and add it to all of your syncthing clients:\nhttps://[unraid machine address]:8443/?id=[Server device ID from next line]"
/opt/discosrv/discosrv -cert="$SYNCTHING_CONFIG/discosrv/cert.pem" -key="$SYNCTHING_CONFIG/discosrv/key.pem" #-stats-file="$SYNCTHING_CONFIG/discosrv/stats.log"
echo "!!!!!!!!! Discovery service died! Ensure config variables are set correctly. !!!!!!!!!!"
