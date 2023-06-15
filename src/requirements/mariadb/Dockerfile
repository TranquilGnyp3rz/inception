FROM debian:10.11

RUN apt-get update && apt-get install -y mariadb-server

RUN sed -i 's/^bind-address\s=./bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf


COPY ./tools/script.sh /
RUN chmod 777 /script.sh

RUN service mysql start && /script.sh

CMD ["mysqld"]
