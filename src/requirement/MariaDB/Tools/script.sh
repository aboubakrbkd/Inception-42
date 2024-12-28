#!/bin/bash

sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|# port = 3306|port=3306|1" /etc/mysql/mariadb.cnf
service mariadb start

# sleep 5

echo "Setting up MariaDB..."

mysqladmin -u root password  "${MARIADB_ROOT_PASSWORD}"
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${MARIADB_DATABASE_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';"
mariadb -e "GRANT ALL ON \`${MARIADB_DATABASE_NAME}\`.* TO '${MARIADB_DATABASE_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"

echo "MariaDB has been set up!"

service mariadb stop

exec mariadbd