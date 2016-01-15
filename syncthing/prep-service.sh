#!/bin/bash

#SYNCTHING_CONFIG=/config #Environment variable should already be set by docker.

if [[ $SYNCTHING_ENABLED == "yes" ]]
then
	echo "Starting syncthing"
	/usr/bin/supervisorctl -c /etc/supervisord.conf start syncthing
fi

if [[ $DISCOVERY_SVR_ENABLED == "yes" ]]
then
	if [[ -f $SYNCTHING_CONFIG/discosrv/cert.pem && -f $SYNCTHING_CONFIG/discosrv/key.pem ]]
	then
		echo "Discovery server certificates exist, starting service."
		/usr/bin/supervisorctl -c /etc/supervisord.conf start discosrv
	else
		echo "Failed to find Discovery server certificates, creating new ones now."
		/opt/syncthing/syncthing --generate="$SYNCTHING_CONFIG/discosrv"
		rm $SYNCTHING_CONFIG/discosrv/config.xml
		echo "Starting Discovery service"
		/usr/bin/supervisorctl -c /etc/supervisord.conf start discosrv
	fi
fi

if [[ $RELAY_SVR_ENABLED == "yes" ]]
then
	if [[ -f $SYNCTHING_CONFIG/relaysrv/cert.pem && -f $SYNCTHING_CONFIG/relaysrv/key.pem ]]
	then
	        echo "Relay server certificates exist, starting service."
	        /usr/bin/supervisorctl -c /etc/supervisord.conf start relaysrv
	else
	        echo "Failed to find Relay server certificates, creating new ones now."
	        /opt/syncthing/syncthing --generate="$SYNCTHING_CONFIG/relaysrv"
	        rm $SYNCTHING_CONFIG/relaysrv/config.xml
		echo "Starting Relay service"
		/usr/bin/supervisorctl -c /etc/supervisord.conf start relaysrv
	fi
fi

