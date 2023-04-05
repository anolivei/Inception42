# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/21 18:07:15 by anolivei          #+#    #+#              #
#    Updated: 2023/04/04 23:48:22 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usa a penúltima imagem do debian como base
FROM debian:buster

# Instala as dependências
RUN apt-get update && apt-get install -y nginx openssl

# Cria o diretório para os arquivos do SSL
RUN mkdir /etc/nginx/ssl

# Gera uma chave privada com criptografia de 2048 bits para o certificado SSL
RUN openssl genrsa -out /etc/nginx/ssl/server.key 2048

# Gera um arquivo de solicitação de assinatura de certificado (CSR) com informações do meu site
RUN openssl req \
    -new -key /etc/nginx/ssl/server.key \
    -out /etc/nginx/ssl/server.csr -subj \
    "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42/OU=Sao Paulo/CN=anolivei/emailAddress=anolivei@mail.com"

# Gera um certificado autoassinado, válido por 365 dias, a partir da solicitação CSR
RUN openssl x509 -req -days 365 \
    -in /etc/nginx/ssl/server.csr \
    -signkey /etc/nginx/ssl/server.key \
    -out /etc/nginx/ssl/server.crt

# Copia o arquivo de configuração do Nginx para o contêiner
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# Abre a porta 443
EXPOSE 443

# Inicia o Nginx
CMD ["nginx", "-g", "daemon off;"]
