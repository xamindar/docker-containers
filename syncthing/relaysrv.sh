#!/bin/bash
#launch relaysrv with env variables
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!! STARTING RELAY SERVER !!!!!!!!!!!!!!!!!!"
echo "use instrustions: http://docs.syncthing.net/users/relaying.html"
/opt/relaysrv/relaysrv -keys="$SYNCTHING_CONFIG/relaysrv" -pools="$RELAY_POOL" -global-rate="$RELAY_GLOBAL_RATE" -per-session-rate="$RELAY_SESSION_RATE" -message-timeout="$RELAY_MESSAGE_TIMEOUT" -network-timeout="$RELAY_NETWORK_TIMEOUT" -ping-interval="$RELAY_PING_INTERVAL" -ext-address="$RELAY_EXT_ADDRESS"

