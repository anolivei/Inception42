# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/13 14:47:30 by anolivei          #+#    #+#              #
#    Updated: 2023/03/31 00:28:33 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@mkdir -p srcs/data/mysql && mkdir -p srcs/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker rmi nginx wordpress mariadb

fclean: clean
	@docker system prune -a --volumes
	@sudo rm -rf srcs/data/

.PHONY: all down fclean
