FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client vim
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools//script.sh /script.sh

RUN chmod +x /script.sh 
RUN service  mysql start && /script.sh

CMD ["mysqld_safe", "--user=mysql", "--console"]
