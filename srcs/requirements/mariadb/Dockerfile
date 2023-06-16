FROM debian:buster


RUN apt update && apt upgrade && apt install mariadb-server -y 
RUN sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
ARG  MYSQL_USER MYSQL_PASSWORD MYSQL_DATABASE MYSQL_ROOT_PASSWORD

COPY ./tools/script.sh .
RUN chmod 777 script.sh

RUN service mysql start && ./script.sh

CMD ["mysqld"]