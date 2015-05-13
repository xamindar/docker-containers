# Dockerfile for syncthing
FROM xamindar/archlinux-base:2015-05-13
MAINTAINER xamindar <junkxamindar@gmail.com>

# Copy additional files to container
# install.sh script
COPY install.sh /tmp/
# Custom supervisord.conf file for docker container
COPY supervisord.conf /etc/
# syncthing program launch file for supervisor
COPY syncthing.ini /etc/supervisor.d/

# Volumes
# Map /config to host defined config path (/mnt/user/appdata/syncthing)
VOLUME /config
# Map /syncfolders to host sync folder location (/mnt/user/syncthing) add more as needed
VOLUME /syncfolders
# Ports in use by this application (upnp is nonworking unless you map 1900 as well). Change net type to host if you have multiple dockers requiring upnp
# Ports used by this application
EXPOSE 8384 22000 21025/udp

# Run Install script
RUN chmod +x /tmp/install.sh && /tmp/install.sh


# run supervisor
CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
