# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/30 01:03:21 by anolivei          #+#    #+#              #
#    Updated: 2023/03/31 16:52:28 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:latest

# Instala as dependências
RUN apt-get update && apt-get install -y \
	php \
	php-fpm \
	php-mysql \
    wget \
	apt-utils \
    unzip

# Faz o download e extrai a última versão do WordPress
RUN wget -P /tmp https://wordpress.org/latest.zip \
	&& unzip /tmp/latest.zip -d /var/www/ \
	&& rm /tmp/latest.zip

# Copia a file .conf para o diretório html
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# Seta o ownership e permissões para as files do WordPress
RUN chown -R www-data:www-data /var/www/wordpress \
	&& chmod -R 755 /var/www/wordpress

# Cria a pasta para que o php possa rodar
RUN mkdir /run/php

# Seta o diretório html como workdir
WORKDIR /var/www/wordpress/

# Configura o wordpress
RUN cp wp-config-sample.php wp-config.php && \
    mv wp-config-sample.php /var/www/wordpress/wp-config.php && \
	sed -i "s/username_here/$MYSQL_USER/g" /var/www/wordpress/wp-config.php && \
	sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/wordpress/wp-config.php && \
	sed -i "s/localhost/$MYSQL_HOST/g" /var/www/wordpress/wp-config.php && \
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config.php && \
	chown -R www-data:www-data /var/www/wordpress

# Abre a porta 9000 para o php-fpm
EXPOSE 9000

# Inicia php-fpm
CMD ["php-fpm7.4", "-F"]
