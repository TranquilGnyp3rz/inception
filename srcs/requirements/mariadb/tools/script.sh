#!bin/sh
mysql -h localhost --password=${MYSQL_ROOT_PASSWORD} -e "create database if not exists ${MYSQL_DATABASE};"
mysql -h localhost --password=${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -h localhost --password=${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
mysql -h localhost --password=${MYSQL_ROOT_PASSWORD} -e "use mysql;UPDATE user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE user='root';UPDATE user SET plugin = 'mysql_native_password', host = '%' WHERE user = 'root';FLUSH PRIVILEGES;"


# echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" | mysql -h localhost -p$MYSQL_ROOT_PASSWORD
# echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -h localhost -p$MYSQL_ROOT_PASSWORD
# echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';" | mysql -h localhost -p$MYSQL_ROOT_PASSWORD
# echo "FLUSH PRIVILEGES;" | mysql -h localhost -p$MYSQL_ROOT_PASSWORD
# echo "use mysql;UPDATE user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE user='root'; \
#         UPDATE user SET plugin = '' WHERE user = 'root';FLUSH PRIVILEGES;" | mysql -h localhost -p$MYSQL_ROOT_PASSWORD