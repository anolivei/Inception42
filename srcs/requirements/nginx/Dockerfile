# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/21 18:07:15 by anolivei          #+#    #+#              #
#    Updated: 2023/03/23 17:47:36 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:stable

RUN apt-get update
RUN apt-get install -y nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
