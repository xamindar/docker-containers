#!/bin/bash
# pacman packages
#packages=""

# Change user nobody to match unRAID's settings
usermod -u 99 nobody
usermod -g 100 nobody
usermod -d /home nobody
chown -R nobody:users /home


# update pacman and install any needed packages
#pacman -Sy --noconfirm
#pacman -S --needed --noconfirm $packages


# download and install latest syncthing into /opt (thanks to gfjardim)
latest_release=$(curl -k -L https://github.com/syncthing/syncthing/releases/latest 2>/dev/null)
regex="(/syncthing/syncthing/releases/download/[^\/]*/syncthing-linux-amd64[^\"]*)"
if [[ $latest_release =~ $regex ]]; then
  URL="https://github.com"${BASH_REMATCH[1]}
  echo "Updating Syncthing"
  rm -rf /opt/syncthing
  echo "Downloading package from: ${URL}"
  mkdir -p /opt/syncthing && wget -nv -O - "${URL}" | tar -xzf - --strip-components=1 -C /opt/syncthing
else
  exit 0
fi

# set ownership
chown -R nobody.users /config
chown -R nobody.users /syncfolders
#chown -R nobody.users /opt/syncthing

# Clean up
yes | pacman -Scc
rm -rf /usr/share/man/*
rm -rf /tmp/*

