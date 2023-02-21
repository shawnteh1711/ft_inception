git pull
docker build -t nginx .
docker stop nginxc
docker rm nginxc
docker run -d --name nginxc -p 443:443 nginx
docker exec -it nginxc bash