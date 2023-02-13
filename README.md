# ft_inception

# Components of Docker
1. Docker Engine
Docer Egine is the base engine installed on your host machine to build and run containers using Docker components and services. It uses a client-server architecture. 

2. Docker Client and Server
Docker Client is accessed from terminal and a Docker Host runs the Docker Daemon and Registry
Docker Client and Server communicate through REST Api.

3. Docker Images
Docker Image is a template with instructions, which is used for creating Docker Containers. Docker File creates a Docker Image using the build command

4. Docker Containers
Docker Container is a standalone executable software package which includes application and their dependencies. Using Docker Image, any user can run the code in order to create Docker Containers.

5. Docker Registry
Docker Registry is an open source server-size service for hosting and distributing images.
Once a Docker Image is built, it's uploaded in a registry or a Docker Hub.

## Common Dockerfile Command
```
Environment variables are supported by the following list of instructions in the Dockerfile:
ADD
COPY
ENV
EXPOSE
FROM
LABEL
STOPSIGNAL
USER
VOLUME
WORKDIR
ONBUILD (when combined with one of the supported instructions above)

```

## Docker exec
``` 
docker run -it --rm <image>
docker exec -it <container_id> <arg>
mysql -proot
```

## Resouces
1. [Docker Tutorial](https://www.youtube.com/watch?v=rOTqprHv1YE)
2. [Docker Makefile](https://earthly.dev/blog/docker-and-makefiles/)
3. [Reference](https://github.com/twagger/inception)
