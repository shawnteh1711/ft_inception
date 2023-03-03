# ft_inception

# Things to install in vm 
```
apt install -y sudo ufw docker docker-compose make openbox xinit kitty firefox-esr filezilla
make ps

```

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

## Docker basic
```
docker login
docker tag maria:latest shawnteh/maria:23-02-15
docker push shawnteh/maria:23-02-15
```

## Docker swarm
```
docker swarm init --advertise -addr 192.168.0.13
docker node ls
docker inspect node
```

## Docker basic
```
docker login
docker tag maria:latest shawnteh/maria:23-02-15
docker push shawnteh/maria:23-02-15
```

## Docker service
```
docker service create --name mymaria --replicas 3 -p 3302:3306 shawnteh/maria:23-02-15
docker service update <container name> --replicas 5
```

## Docker volume
```
docker volume ls
```

## Docker network
```
docker network ls
docker network create -d bridge my_bridge
docker run -d --net=my_bridge --name container

```

## Docker build and run
```
docker build -t <name> .
docker history imagename
docker run -it --rm <image>
docker run -d --name maria_c -p 3306:3306 maria
docker run --name mariadbtest -e MYSQL_ROOT_PASSWORD=mypass -p 3306:3306 -d docker.io/library/mariadb:10.2
```

### Docker exec
```
docker exec -it <container_id> <arg>
mysql -proot
docker ps
```

# Test Redis
```
Start the Redis CLI by typing redis-cli and pressing Enter.

Check if Redis is working by typing ping and pressing Enter. If Redis is working, the CLI will return PONG.

Set a key-value pair by typing set key value and pressing Enter, where key is the name of the key and value is the value to be stored. For example, set name John.

Retrieve the value of the key by typing get key and pressing Enter, where key is the name of the key. For example, get name. If the key exists, the CLI will return its value.

Retrieve all keys by typing keys * and pressing Enter. This will return a list of all keys stored in Redis.

DEBUG OBJECT key
```

# Test ftp using ncftp
```
ncftp ENTER
open -u ftpuser -p ftpass 127.0.0.1
get server file
get -R server folder
put local file
put -R local file



## Resouces
1. [Docker Tutorial](https://www.youtube.com/watch?v=rOTqprHv1YE)
2. [Docker Makefile](https://earthly.dev/blog/docker-and-makefiles/)
3. [Reference](https://github.com/twagger/inception)
4. [Debian Docker installation](https://docs.docker.com/engine/install/debian/)
5. [Nginx conf](https://www.plesk.com/blog/various/nginx-configuration-guide/#:~:text=Every%20NGINX%20configuration%20file%20will,interchangeably%20as%20blocks%20or%20contexts%20.)
6. [Guide](https://github.com/vbachele/Inception)
7. [More Guide](https://github.com/codesshaman/inception/blob/main/00_INSTALL_SYSTEM.md)
