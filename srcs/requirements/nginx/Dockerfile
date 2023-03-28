# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/21 18:07:15 by anolivei          #+#    #+#              #
#    Updated: 2023/03/28 15:33:25 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:latest

# Instala as dependências
RUN apt-get update && apt-get install -y nginx openssl

# Cria o diretório para os arquivos do SSL
RUN mkdir /etc/nginx/ssl

# Gera uma chave privada para o certificado SSL
#RUN openssl genrsa -out /etc/nginx/ssl/server.key 2048

# Gera uma solicitação de assinatura de certificado (CSR)
#RUN openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.pem -subj "/CN=localhost"

# Gera um certificado autoassinado a partir da solicitação CSR
#RUN openssl x509 -req -days 365 -in /etc/nginx/ssl/server.pem -signkey /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/server.pem \
        -keyout /etc/nginx/ssl/server.key \
        -subj "/C=BR/ST=SP/L=SP/O=42 School/OU=server/CN=server/"

# Copia o arquivo de configuração do Nginx para o contêiner
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./tools/index.html /var/www/html

# Abre a porta 80 e 443
EXPOSE 80
EXPOSE 443

# Inicia o Nginx
CMD ["nginx", "-g", "daemon off;"]

