#!/bin/bash

db_password=$(cat $DB_PASSWORD)
db_root_password=$(cat $DB_ROOT_PASSWORD)

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > /etc/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$db_password';" >> /etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> /etc/mysql/init.sql
echo "ALTER USER '$DB_ROOT_NAME'@'localhost' IDENTIFIED BY '$db_root_password';" >> /etc/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

exec mysqld