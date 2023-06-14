#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	wp core install --url="https://heloufra.42.fr" --title="heloufra" --admin_user="heloufra" --admin_password="@MYSQL_PASSWORD" --admin_email="heloufra@42.fr"
	wp user create heloufra heloufra@42.fr --user_pass=$MYSQL_PASSWORD --display_name=heloufra --role=administrator --allow-root
fi

exec "$@"



#!/bin/bash

# chown -R www-data /wordpress
# cd wordpress

# rm -rf wp-config.php

# wp core config --allow-root --dbhost=${MYSQL_HOST} --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD}

# wp config set --allow-root 'FS_METHOD' ${WP_FS_METHOD};
# wp config set --allow-root 'WP_REDIS_HOST' ${WP_REDIS_HOST};
# wp config set --allow-root 'WP_REDIS_PORT' ${WP_REDIS_PORT};
# cd wordpress
# chmod +x wp-config.php

# wp core install --allow-root --url=${URL_DNS} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PSW} --admin_email=${WP_ADMIN_EMAIL}
# wp user --allow-root create ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_USER}
# wp plugin install --allow-root redis-cache --activate
# wp redis enable --allow-root

# exec php-fpm7.3 -F -R