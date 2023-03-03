# ft_inception

# How Docker and docker compose work
Docker is a containerization platform that allow developers to package application and their dependencies into portable and self-contained containers.
This allow
- applications to run in a consistent and isolated environment
- lightweight and isolated make them an ideal choice for deploying microservices
Docker Compose is a tool that allows you to define and run multi-container Docker applications. It allow
- simple way to manage dependencies between containers
- configuration of network and storage requirement of application using YAML file

# Containerization technology use in Docker
1. Namespace: used to isolate processes so they can't see or interact with processes running in other namespaces. This is what enables containers to be isolated from one another and from the host system.

2. Control groups (cgroups): a kernel feature that allows resource usage to be limited and shared among groups of processes. This is how Docker can control the amount of resources each container uses.

3. Union file system: a way to layer file system on top of each other, where the contents of files in the upper layer "override" the contents in the lower layers. This is how Docker can create images that are based on other images, with addition layers added on top.

4. Container format: Docker uses a container format based on the linux Container (LXC) format, but with some modification to improve security and portability.

# Difference between a Docker image used with docker compose and without docker compose
A Docker image is a packaged, standalone executable package that contains all the necessary dependencies and configuration to run in an application.
When using Docker without Compose, you typically build a Docker image for each individual application component and manually run and link them using Docker network command.

```
docker network create my-network
docker run --name container1 --network my-network -d image1
docker run --name container2 --network my-network -d image2
```
This can be time-consuming and error-prone, especially when working with large or complex applications.

With Docker Compose, you can define a multi-container application in a single YAML file, which makes it easier to manage and deply complex applications. You can specify the configuration for each container include dependencies and network settinfs, and then start the application with a single command. Docker Compose will automatically build and start the necessary containers and confifure them to work together.

# The benefit of Docker compared to VMs
1. lightweight: Docker container are much lighter than VMs, as they don't need to run a seperate operating system. Instead, Docker container share the host operating system kernel and only include minimal dependencies required to run the application.

2. Faster startup: Docker containers can start much faster than VMs, as they only need to start the application process and not an entire operating system.

3. Resource efficient: Since Docker containers share the host operating system kernel, they use fewer resources compared to VMs, making them more efficient in terms of CPU, memory  and disk usage.

4. Consistent environment: Docker allows developers to create and run applications in the same environment, ensuring consistency across different machines and reducing the risk of application issues caused by environmental differences.

5. Protability: Docker containers can run on any machine with Docker installed regardless of underlying operating system or hardware.

# Disadvantage of docker to vm
1. Security: Docker containers share the host kernel, which means that if the host system is compromised, all the containers on that system are also at risk. 

2. Resource sharing: Since Docker containers share the host kernel, they cannot have their own kernel modules or system libraries, which can limit their ability to utilize certain resources or perform certain tasks.

3. Complexity: Docker introduces an additional layer of complexity to the deployment proces, requiring additional expertise and tools to manage containerized applications.

# Things to install in vm 
```
apt install -y sudo ufw docker docker-compose make openbox xinit kitty firefox-esr filezilla
make ps

```
![Structure comparison between Vm and Docker]
(https://media.licdn.com/dms/image/C4D12AQE8eZPFE0ITNw/article-inline_image-shrink_1500_2232/0/1650686504419?e=1683158400&v=beta&t=NS7NpVPKGX6JuPCHGuY-aCfFHTYAry00wL_ygp_GJZM)

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
```



## Resouces
1. [Docker Tutorial](https://www.youtube.com/watch?v=rOTqprHv1YE)
2. [Docker Makefile](https://earthly.dev/blog/docker-and-makefiles/)
3. [Reference](https://github.com/twagger/inception)
4. [Debian Docker installation](https://docs.docker.com/engine/install/debian/)
5. [Nginx conf](https://www.plesk.com/blog/various/nginx-configuration-guide/#:~:text=Every%20NGINX%20configuration%20file%20will,interchangeably%20as%20blocks%20or%20contexts%20.)
6. [Guide](https://github.com/vbachele/Inception)
7. [More Guide](https://github.com/codesshaman/inception/blob/main/00_INSTALL_SYSTEM.md)
