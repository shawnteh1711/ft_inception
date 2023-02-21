git pull
docker build -t wp .
docker stop wpc
docker rm wpc
docker run -d --name wpc wp
docker exec -it wpc bash