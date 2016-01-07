# Dockerfile for syncthing
FROM xamindar/archlinux-base:2015-05-13
MAINTAINER xamindar <junkxamindar@gmail.com>

# Environment variables
ENV HOME /home

# Copy additional files to container
# install.sh script
COPY install.sh /home
COPY manual_install.sh /home
# Custom supervisord.conf file for docker container
COPY supervisord.conf /etc/
# syncthing program launch file for supervisor
COPY ffsync.conf /etc/supervisor.d/
# Run Install script
RUN chmod +x /home/* && /bin/bash /home/install.sh

# Volumes
# Map /config to host defined config path (/mnt/user/appdata/syncthing)
VOLUME /config
# Ports in use by this application.
EXPOSE 3030

# run supervisor
CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
