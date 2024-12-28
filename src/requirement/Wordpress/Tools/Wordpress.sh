#!/bin/bash

mkdir -p /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chown -R www-data:www-data /var/www/html/

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

wp core download --allow-root

touch wp-config.php

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf

sed -i 's/database_name_here/'$MARIADB_DATABASE_NAME'/g' /var/www/html/wp-config.php

sed -i 's/username_here/'$MARIADB_DATABASE_USER'/g' /var/www/html/wp-config.php

sed -i 's/password_here/'$MARIADB_USER_PASSWORD'/g' /var/www/html/wp-config.php

sed -i 's/localhost/'$DOMAIN_NAME'/g' /var/www/html/wp-config.php

wp core install --url=$DOMAIN_NAME --title="Wordpress site" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root

wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role='author' --allow-root

echo "3LA LLAH YDOOOOOOOOZ"

php-fpm7.4 -F
