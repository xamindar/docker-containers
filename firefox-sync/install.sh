#!/bin/bash
# pacman packages
packages="nodejs npm openssh graphicsmagick redis vim"
# update pacman
pacman -Sy --noconfirm

# Change user nobody to match unRAID's settings
#usermod -u 99 nobody
#usermod -g 100 nobody
usermod -d /home nobody
chown -R nobody:users /home


### AUR specific setup if AUR packages are needed
#install packages needed for AUR installation
pacman -S --needed --noconfirm sudo base-devel git

# Set up user nobody for use with makepkg and sudo
passwd -d nobody
echo "nobody ALL=(ALL) ALL" >> /etc/sudoers
usermod -s /bin/bash nobody

# Download mozilla-firefox-sync-server-git from AUR, build and install it.
cd /home
sudo -u nobody curl https://aur4.archlinux.org/cgit/aur.git/snapshot/mozilla-firefox-sync-server-git.tar.gz | sudo -u nobody tar zx
cd /home/mozilla-firefox-sync-server-git
sudo -u nobody makepkg -is --noconfirm

# Download nvm-git from AUR, build and install it.
cd /home
sudo -u nobody curl https://aur.archlinux.org/packages/nv/nvm-git/nvm-git.tar.gz | sudo -u nobody tar zx
cd /home/nvm-git
sudo -u nobody makepkg -is --noconfirm

### End AUR specific section

#Install any needed packages
pacman -S --needed --noconfirm $packages


## Manual install of ffsync auth server
sudo -u nobody /home/manual_install.sh

## End manual install section

# set permissions
#chown -R nobody.users /opt/syncthing

# Clean up
#lock nobody again
#passwd -l nobody
#rm /etc/sudoers
#usermod -s /usr/bin/nologin nobody
#remove un-needed files
#yes | pacman -Scc
#rm -rf /usr/share/man/*

