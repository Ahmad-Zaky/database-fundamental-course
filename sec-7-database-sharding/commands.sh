docker build -t pgshard .
docker run --name pgshard1 -p 5432:5432 -e POSTGRES_HOST=localhost -e POSTGRES_DATABASE=postgres -e POSTGRES_USERNAME=postgres -e POSTGRES_PASSWORD=postgres -d pgshard
docker run --name pgshard2 -p 5433:5432 -e POSTGRES_HOST=localhost -e POSTGRES_DATABASE=postgres -e POSTGRES_USERNAME=postgres -e POSTGRES_PASSWORD=postgres -d pgshard
docker run --name pgshard3 -p 5434:5432 -e POSTGRES_HOST=localhost -e POSTGRES_DATABASE=postgres -e POSTGRES_USERNAME=postgres -e POSTGRES_PASSWORD=postgres -d pgshard
