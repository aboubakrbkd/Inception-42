#!/bin/bash

mkdir -p /var/www/html
mkdir -p /run/php/

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chown -R www-data:www-data /var/www/html/

chmod 755 -R /var/www/html

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

wp core download --allow-root

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

wp config create --dbname=$MARIADB_DATABASE_NAME --dbuser=$MARIADB_DATABASE_USER --dbpass=$MARIADB_USER_PASSWORD --dbhost=mariadb --allow-root

wp core install --url=$DOMAIN_NAME --title="Wordpress site" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root

wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role='author' --allow-root

php-fpm7.4 -F
