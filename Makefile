# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/13 14:47:30 by anolivei          #+#    #+#              #
#    Updated: 2023/03/30 19:27:51 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	cd srcs/ && docker-compose up --build -d

down:
	cd srcs/ && docker-compose down

fclean:
	docker rmi debian nginx wordpress
