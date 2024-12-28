#!/bin/bash

# Check if WordPress is already installed
if [ -f /var/www/html/wp-config.php ]; then
    echo "WordPress is already installed."
else
    sleep 5
    # Create necessary directories
    mkdir -p /run/php/
    mkdir -p /var/www/html

    cd /var/www/html
    rm -rf *

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

    chown -R www-data:www-data /var/www/html/

    chmod 755 -R /var/www/html

    chmod +x wp-cli.phar

    mv wp-cli.phar /usr/local/bin/wp

    wp core download --allow-root

    # cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

    wp config create --dbname=$MARIADB_DATABASE_NAME --dbuser=$MARIADB_DATABASE_USER --dbpass=$MARIADB_USER_PASSWORD --dbhost=$MARIADB_DATABASE_HOSTNAME --allow-root

    wp core install --url=$DOMAIN_NAME --title="Wordpress site" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root

    wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role='author' --allow-root
fi
php-fpm7.4 -F

