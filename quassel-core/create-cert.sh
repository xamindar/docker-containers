#!/bin/bash

# First, prepare the SSL certificate. Gather variables.
COUNTRY=${SSL_COUNTRY:-US}
STATE=${SSL_STATE:-house}
LOCATION=${SSL_LOCATION:-room}
ORG=${SSL_ORG:-irc_clients}
GROUP=${SSL_GROUP:-Dockers}
NAME=${SSL_NAME:-unRaid}
EMAIL=${SSL_EMAIL:-unraid@nothing.com}

#echo $COUNTRY, $STATE, $LOCATION, $ORG, $GROUP, $NAME. $EMAIL

#truncate the country variable to 2 characters as required
COUNTRY=`echo $COUNTRY | cut -c1-2`
#echo $CO
# Verify quassel config directory is set.
if [ -z $QUASSEL_CONFIG ] 
then
	echo "Environment variable QUASSEL_CONFIG is not set!" 
	exit 1
else
	if [ ! -f $QUASSEL_CONFIG/quasselCert.pem ]
	then
		echo "Creating new certificate file." 
		openssl req \
		-x509 \
		-nodes \
		-days 3650 \
		-newkey rsa:4096 \
		-keyout $QUASSEL_CONFIG/quasselCert.pem \
		-out $QUASSEL_CONFIG/quasselCert.pem \
		-subj "/C=$COUNTRY/ST=$STATE/L=$LOCATION/O=$ORG/OU=$GROUP/CN=$NAME/emailAddress=$EMAIL"
		#launch quassel-core
		/usr/bin/supervisorctl -c /etc/supervisord.conf start quasselcore
	else
		echo "$QUASSEL_CONFIG/quasselCert.pem already exists, not recreated."
		 #launch quassel-core
		/usr/bin/supervisorctl -c /etc/supervisord.conf start quasselcore

	fi
fi

