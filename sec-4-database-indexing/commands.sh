# Spin up postgres image
docker run --name pg1 -e POSTGRES_PASSWORD=postgres postgres

# exec into the image container
docker exec -it pg1 psql -U postgres