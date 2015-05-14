# Dockerfile for syncthing
FROM xamindar/archlinux-base:2015-05-13
MAINTAINER xamindar <junkxamindar@gmail.com>

# Copy additional files to container
# install.sh script
COPY install.sh /tmp/
# Custom supervisord.conf file for docker container
COPY supervisord.conf /etc/
# syncthing program launch file for supervisor
COPY syncthing.conf /etc/supervisor.d/
COPY syncthing.old /opt/
# Run Install script
RUN chmod +x /tmp/install.sh && /bin/bash /tmp/install.sh && rm /tmp/install.sh

# Volumes
# Map /config to host defined config path (/mnt/user/appdata/syncthing)
VOLUME /config
# Map /syncfolders to host sync folder location (/mnt/user/syncthing) add more as needed
VOLUME /syncfolders
# Ports in use by this application.
EXPOSE 8384 22000 21025/udp

# run supervisor
CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
