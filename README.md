# OpenGrok:

opengrok version: [opengrok-1.0](https://github.com/OpenGrok/OpenGrok/releases/download/1.0/opengrok-1.0.tar.gz)

image base on: [tomcat:9.0](https://registry.hub.docker.com/_/tomcat/)

Chinese characters support

# ToDo:

* remove download link

* auth support

## Start:

```
sudo docker run --rm \
    -v /path/to/source:/src \
    -v /path/to/opengrok_data:/data \
    -p 8888:8080 \
    scue/docker-opengrok
```

then, the search engine is available at `http://localhost:8888/source`.

## Reindex
To perform reindex while the container is running, perform the following:

```
sudo docker exec ${CONTAINER_NAME} OpenGrok index /src
```

where the *${CONTAINER_NAME}* is the name/id to this docker image.
