#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER kodiaq WITH SUPERUSER PASSWORD 'kodiaq';
    CREATE DATABASE kodiaq_developmen;
	CREATE DATABASE kodiaq_test;
	CREATE DATABASE kodiaq_production;
    GRANT ALL PRIVILEGES ON DATABASE kodiaq_developmen TO kodiaq;
	GRANT ALL PRIVILEGES ON DATABASE kodiaq_test TO kodiaq;
	GRANT ALL PRIVILEGES ON DATABASE kodiaq_production TO kodiaq;
EOSQL