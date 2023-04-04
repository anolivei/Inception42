# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/30 23:40:21 by anolivei          #+#    #+#              #
#    Updated: 2023/04/04 20:03:47 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:latest

ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update && \
	apt-get install -y mariadb-server

COPY ./conf/backup.sql /

# Configure MariaDB
RUN sed -i 's/bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf && \
	/usr/bin/mysqld_safe & \
	sleep 5s && \
	echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql && \
	mysql -e "CREATE DATABASE $MYSQL_DATABASE;" && \
	mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" && \
	mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" && \
	mysql -e "FLUSH PRIVILEGES;" && \
	mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < backup.sql ;

EXPOSE 3306

CMD ["mysqld"]
