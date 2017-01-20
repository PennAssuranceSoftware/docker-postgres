# Postgres Docker
<img src="https://codeship.com/projects/327e7b50-c0e5-0134-24ab-7ee917b55fa1/status?branch=master" />

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

## Setup AWS
1. Create a file `aws.env` with the AWS credentials
````
AWS_ACCESS_KEY_ID=your_access_key_id
AWS_SECRET_ACCESS_KEY=your_secret_access_key
````
2. Generate encryption key
````
jet generate
````
3. Add aws.env and codeship.aes to .gitignore
````
aws.env
codeship.aes
````
3. Encrypt the file
````
jet encrypt aws.env aws.env.encrypted
````
4. Test build
````
jet steps --push
````
