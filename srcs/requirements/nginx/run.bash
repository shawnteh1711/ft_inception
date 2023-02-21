git pull
docker build -t nginx .
docker stop nginxc
docker rm nginxc
docker run -d --name -p 443:443 nginxc nginx
docker exec -it nginxc bash