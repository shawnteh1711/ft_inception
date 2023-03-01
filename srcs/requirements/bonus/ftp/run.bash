git pull
docker build -t ftp .
docker stop ftpc
docker rm ftpc
docker run -d --name ftpc ftp
docker exec -it ftpc bash