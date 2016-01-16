#!/bin/bash
#start discosrv using environment variables
/opt/discosrv/discosrv -cert="$SYNCTHING_CONFIG/discosrv/cert.pem" -key="$SYNCTHING_CONFIG/discosrv/key.pem" -stats-file="$SYNCTHING_CONFIG/discosrv/stats.log"

