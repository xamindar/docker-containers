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

# download and install latest syncthing into /opt
install_location="/opt/syncthing"
latest_release_url=$(curl -k -L https://api.github.com/repos/syncthing/syncthing/releases/latest  2>/dev/null | grep 'browser_download_url.*linux-amd64' | cut -d \" -f4)
if [[ -n ${latest_release_url} ]]; then
  echo "Updating Syncthing"
  rm -rf ${install_location}
  echo "Downloading package from: ${latest_release_url}"
  mkdir -p ${install_location} && wget -nv -O - "${latest_release_url}" | tar -xzf - --strip-components=1 -C ${install_location}
else
  exit 1
fi

# download and install latest discovery server into /opt
install_location="/opt/discosrv"
latest_release_url=$(curl -k -L https://api.github.com/repos/syncthing/discosrv/releases/latest  2>/dev/null | grep 'browser_download_url.*linux-amd64' | cut -d \" -f4)
if [[ -n ${latest_release_url} ]]; then
  echo "Updating Syncthing"
  rm -rf ${install_location}
  echo "Downloading package from: ${latest_release_url}"
  mkdir -p ${install_location} && wget -nv -O - "${latest_release_url}" | tar -xzf - --strip-components=1 -C ${install_location}
else
  exit 1
fi

# download and install latest relay server into /opt
install_location="/opt/relaysrv"
latest_release_url=$(curl -k -L https://api.github.com/repos/syncthing/relaysrv/releases/latest  2>/dev/null | grep 'browser_download_url.*linux-amd64' | cut -d \" -f4)
if [[ -n ${latest_release_url} ]]; then
  echo "Updating Syncthing"
  rm -rf ${install_location}
  echo "Downloading package from: ${latest_release_url}"
  mkdir -p ${install_location} && wget -nv -O - "${latest_release_url}" | tar -xzf - --strip-components=1 -C ${install_location}
else
  exit 1
fi

### OLD - - DELETE ###
## download and install latest syncthing into /opt (thanks to gfjardim)
#latest_release=$(curl -k -L https://github.com/syncthing/syncthing/releases/latest 2>/dev/null)
#regex="(/syncthing/syncthing/releases/download/[^\/]*/syncthing-linux-amd64[^\"]*)"
#if [[ $latest_release =~ $regex ]]; then
#  URL="https://github.com"${BASH_REMATCH[1]}
#  echo "Updating Syncthing"
#  rm -rf /opt/syncthing
#  echo "Downloading package from: ${URL}"
#  mkdir -p /opt/syncthing && wget -nv -O - "${URL}" | tar -xzf - --strip-components=1 -C /opt/syncthing
#else
#  exit 0
#fi
######################

# set permissions
chown -R nobody.users /opt/*

# Clean up
yes | pacman -Scc
rm -rf /usr/share/man/*

