# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/13 14:47:30 by anolivei          #+#    #+#              #
#    Updated: 2023/03/30 00:49:45 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	cd srcs/ && docker-compose up --build -d

down:
	cd srcs/ && docker-compose down

clean:
	docker rmi srcs_nginx && docker rmi debian