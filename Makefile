# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/13 14:47:30 by anolivei          #+#    #+#              #
#    Updated: 2023/04/03 18:02:43 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@mkdir -p srcs/data/mysql && mkdir -p srcs/data/wordpress
	@cd srcs/ && docker compose -f docker-compose.yml up -d --build

down:
	@cd srcs/ && docker compose -f docker-compose.yml down

clean:
	@docker rmi nginx wordpress mariadb

fclean: clean
	@docker system prune -a --volumes
	@sudo rm -rf srcs/data/

.PHONY: all down fclean
