# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/13 14:47:30 by anolivei          #+#    #+#              #
#    Updated: 2023/04/04 00:24:02 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOMAIN = $(shell awk '/anolivei.42.fr/{print $$2}' /etc/hosts)
VOLUMES = $(shell docker volume ls -q)
IMAGES = $(shell docker images -q)

all: hosts
	@echo "Creating local data folder"
	@mkdir -p srcs/data/mysql && mkdir -p srcs/data/wordpress
	@echo "Up"
	@cd srcs/ && docker compose -f docker-compose.yml up -d --build

hosts:
ifneq (${DOMAIN},anolivei.42.fr)
	@echo "Adding domain to etc/hosts"
	@cp /etc/hosts ./hosts_backup
	@sudo rm /etc/hosts
	@sudo cp ./srcs/requirements/nginx/tools/hosts /etc/
endif

down:
	@echo "Down"
	@cd srcs/ && docker compose -f docker-compose.yml down

clean:
ifneq ($(VOLUMES),)
	@echo "Removing volumes"
	@docker volume rm $(VOLUMES)
endif
ifneq ($(IMAGES),)
	@echo "Removing images"
	@docker rmi $(IMAGES)
endif

fclean: clean
	@echo "Prune volumes"
	@docker system prune -a --volumes
	@echo "Removing local data folder"
	@sudo rm -rf srcs/data/
	@echo "Restauring etc/hosts"
	@sudo mv ./hosts_backup /etc/hosts

.PHONY: all hosts down clean fclean
