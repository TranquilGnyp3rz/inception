FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client vim

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./script.sh /script.sh
RUN chmod +x /script.sh

ENTRYPOINT [ "script.sh" ]

CMD ["mysqld"]

