COMPOSE_YML = ./srcs/docker-compose.yml
WORDPRESS_SRCS = /home/shawn/data/wordpress
MARIADB_SRCS = /home/shawn/data/mariadb
DOCKER_USERNAME ?= shawnteh
APPLICATION_NAME ?= inception
GIT_HASH ?= $(shell git log --format="%h" -n 1)
container = $(DOCKER_USERNAME)/$(APPLICATION_NAME):$(GIT_HASH)

.PHONY: all init build_up up down build clean fclean ps re docker_build docker_push docker_release

all: build_up

build_up:
			mkdir -p $(WORDPRESS_SRCS) $(MARIADB_SRCS)
			docker-compose -f $(COMPOSE_YML) up --build

up:
			docker-compose -f $(COMPOSE_YML) up

down:		
			docker-compose -f $(COMPOSE_YML) down

build:
			docker-compose -f $(COMPOSE_YML) build --no-cache

clean: down
		docker image prune -a -f
		docker volume prune -f
		docker network prune -f
		
	
fclean: clean
		rm -rf $(WORDPRESS_SRCS) $(MARIADB_SRCS)
		docker system prune -a -f
		# docker volume rm $$(docker volume ls -q)
ps:
		docker-compose -f ($COMPOSE_YML) ps

re: fclean build_up

docker_build:
			docker build --tag $(container) .

docker_push:
			docker push $(container)

docker_release:
			docker pull $(container)
			docker tag $(container) $(DOCKER_USERNAME)/$(APPLICATION_NAME):latest
			dockeR push $(DOCKER_USERNAME)/$(APPLICATION_NAME):latest 


