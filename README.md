## Build
````
docker build -t pennassurancesoftware/postgres:latest .
````

## Run
````
docker run -d --name=db -p 5432:5432 -e POSTGRES_USER="super" -e POSTGRES_DB="yaas" -e POSTGRES_PASSWORD="postgres" pennassurancesoftware/postgres:latest
````

## Notes
I used the [pynab-docker](https://github.com/Herkemer/pynab-docker) repository as a reference.

Another reference for setting up Postgres in Docker: [postgres-docker](https://hub.docker.com/r/dcerecedo/postgres-docker/~/dockerfile/)
