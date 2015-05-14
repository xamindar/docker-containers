# Xamindar Syncthing

Docker image for Syncthing (http://syncthing.net)

Run with:

```
docker run -d --name="Syncthing" \
      --net="bridge" \
      -p 8384:8384/tcp \
      -p 22000:22000/tcp \
      -p 21025:21025/udp \
      -v "/mnt/user/appdata/syncthing":"/config":rw \
      -v "/mnt/user/syncthing":"/syncfolders":rw \
      xamindar/syncthing

Or:

docker run -d --name="Syncthing" \
      --net="host" \
      -v "/mnt/user/appdata/syncthing":"/config":rw \ 
      -v "/mnt/user/syncthing":"/syncfolders":rw \ 
      xamindar/syncthing
```
