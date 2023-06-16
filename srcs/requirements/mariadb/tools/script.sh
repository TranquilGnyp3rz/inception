#!bin/sh


mysql -h localhost --user=root --database=mysql <<-EOSQL
create database if not exists ${MYSQL_DATABASE};
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;
UPDATE user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE user='root';
UPDATE user SET plugin = 'mysql_native_password', host = '%' WHERE user = 'root';
FLUSH PRIVILEGES;
EOSQL

mysqld_safe --user=mysql --console
