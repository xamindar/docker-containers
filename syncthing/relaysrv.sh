#!/bin/bash
#launch relaysrv with env variables
echo -e "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n!!!!!!!!!!!!!!!!!! STARTING RELAY SERVER !!!!!!!!!!!!!!!!!!\nuse instrustions: https://docs.syncthing.net/users/strelaysrv.html"
/opt/relaysrv/relaysrv -keys="$SYNCTHING_CONFIG/relaysrv" -pools="$RELAY_POOL" -global-rate="$RELAY_GLOBAL_RATE" -per-session-rate="$RELAY_SESSION_RATE" -message-timeout="$RELAY_MESSAGE_TIMEOUT" -network-timeout="$RELAY_NETWORK_TIMEOUT" -ping-interval="$RELAY_PING_INTERVAL"
echo "!!!!!!!!! Relay service died! Ensure config variables are set correctly. !!!!!!!!!!"
