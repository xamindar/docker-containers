# Xamindar Quassel-core

Docker image for Quassel-core (http://www.quassel-irc.org)

Run with:

```
docker run -d --name="Quassel-core" \
      --net="bridge" \
      -p 4242:4242/tcp \
      -v "/mnt/user/appdata/quassel-core":"/config":rw \
      xamindar/quassel-core
```
