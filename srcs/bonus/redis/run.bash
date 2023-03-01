git pull
docker build -t maria .
docker stop mariac
docker rm mariac
docker run -d --name mariac maria
docker exec -it mariac bash