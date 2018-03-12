#!/bin/sh

docker-compose -f ../docker-compose.yml run --entrypoint=/bin/bash science_db_backend './init_database.sh'
