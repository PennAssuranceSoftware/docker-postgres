export PGUSER=postgres

if [ -z "$DB_NAME" ]; then
    echo "No Database Specified"
else
  EXISTS=`psql <<- EOSQL
     SELECT 1 FROM pg_database WHERE datname='$DB_NAME';
  EOSQL`
  echo "******CREATING $DB_NAME DATABASE******"
  if [[ $EXISTS == "1" ]]; then
      echo "Database $DB_NAME Already Exists"
  else
      psql -c "CREATE ROLE $DB_USER WITH LOGIN ENCRYPTED PASSWORD '${DB_PASS}' CREATEDB;"
      psql -c "CREATE DATABASE $DB_NAME WITH OWNER $DB_USER TEMPLATE template0 ENCODING 'UTF8';"
      psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"
      psql -c "ALTER SCHEMA pg_catalog OWNER TO $DB_USER;"
      echo ""
      echo "******DOCKER $DB_NAME CREATED******"
  fi
fi
