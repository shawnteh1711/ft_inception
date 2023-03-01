git pull
docker build -t redis .
docker stop redisc
docker rm redisc
docker run -d --name redisc redis
docker exec -it redisc bash