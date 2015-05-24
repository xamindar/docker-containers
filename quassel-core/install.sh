#!/bin/bash
# pacman packages
packages="quassel-core"

# Change user nobody to match unRAID's settings
usermod -u 99 nobody
usermod -g 100 nobody
usermod -d /home nobody
chown -R nobody:users /home


# update pacman and install any needed packages
pacman -Sy --noconfirm
pacman -S --needed --noconfirm $packages

# set permissions
#chown -R nobody:users /var/lib/quassel

# Clean up
yes | pacman -Scc
rm -rf /usr/share/man/*

