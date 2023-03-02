git pull
docker build -t adminer .
docker stop adminerc
docker rm adminerc
docker run -d --name adminerc adminer
docker exec -it adminerc bash