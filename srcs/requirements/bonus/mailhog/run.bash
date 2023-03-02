git pull
docker build -t mailhog .
docker stop mailhogc
docker rm mailhogc
docker run -d --name mailhogc mailhog
docker exec -it mailhogc bash