#!/bin/bash
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	CREATE USER science_db WITH SUPERUSER PASSWORD 'science_db';
	CREATE DATABASE science_db_development OWNER science_db;
	CREATE DATABASE science_db_test OWNER science_db;
	CREATE DATABASE science_db_production OWNER science_db;
EOSQL
