#!/bin/bash

service mariadb start

sleep 5

echo "Setting up MariaDB..."

echo "Setting up Database Name"
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE_NAME}\`;"

echo "Setting up Database User"
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MARIADB_DATABASE_USER}'@'localhost' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';"

echo "Setting up all Privileges to the User"
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE_NAME}\`.* TO '${MARIADB_DATABASE_USER}'@'localhost';"

echo "Changing root user password"
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"

mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

echo "MariaDB has been set up!"

mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown

sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

exec mariadbd