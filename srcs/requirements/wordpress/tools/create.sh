#!/bin/bash
sleep 10

chown -R www-data /wordpress
cd /wordpress
# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
rm -rf wp-config.php
wp  config create --allow-root --dbhost="${MYSQL_HOSTNAME}" --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}"

chmod +x wp-config.php
wp core install --allow-root --url="${URL_DNS}" --title="${WP_TITLE}" --admin_name="${WP_ADMIN}" --admin_password="${WP_ADMIN_PSW}" --admin_email="${WP_ADMIN_EMAIL}"
wp user create --allow-root ${WP_USR} ${WP_EMAIL} --user_pass=${WP_PWD} --role=${WP_USER_ROLE}

exec php-fpm7.3 -F -R
