#!/bin/bash
# pacman packages
packages="quassel-core"

# Change user nobody to match unRAID's settings
usermod -u 99 nobody
usermod -g 100 nobody
usermod -d /home nobody
mkdir /config


# update pacman and install any needed packages
pacman -Sy --noconfirm
pacman -S --needed --noconfirm $packages

# set permissions
chown -R nobody:users /home
chown -R nobody:users /config

# Clean up
yes | pacman -Scc
rm -rf /usr/share/man/*

