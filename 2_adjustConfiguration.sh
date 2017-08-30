#!/bin/bash
echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.6.4/main/pg_hba.conf
echo "listen_addresses='*'" >> /etc/postgresql/9.6.4/main/postgresql.conf