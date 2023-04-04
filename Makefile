# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anolivei <anolivei@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/13 14:47:30 by anolivei          #+#    #+#              #
#    Updated: 2023/04/04 20:07:16 by anolivei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOMAIN = $(shell awk '/anolivei.42.fr/{print $$2}' /etc/hosts)
VOLUMES = $(shell docker volume ls -q)
IMAGES = $(shell docker images -q)

all: hosts
	@echo "\033[0;32mCreating local data folder\033[0m"
	@sudo mkdir -p /home/anolivei/data/mysql && sudo mkdir -p /home/anolivei/data/wordpress
	@echo "\033[0;32mUp\033[0m"
	@cd srcs/ && docker compose -f docker-compose.yml up -d --build

hosts:
ifneq (${DOMAIN},anolivei.42.fr)
	@echo "\033[0;32mAdding domain to etc/hosts\033[0m"
	@cp /etc/hosts ./hosts_backup
	@sudo rm /etc/hosts
	@sudo cp ./srcs/requirements/nginx/tools/hosts /etc/
endif

down:
	@echo "\033[0;32mDown\033[0m"
	@cd srcs/ && docker compose -f docker-compose.yml down

clean:
ifneq ($(VOLUMES),)
	@echo "\033[0;32mRemoving volumes\033[0m"
	@docker volume rm $(VOLUMES)
endif
ifneq ($(IMAGES),)
	@echo "\033[0;32mRemoving images\033[0m"
	@docker rmi $(IMAGES)
endif

fclean: clean
	@echo "\033[0;32mPrune volumes\033[0m"
	@docker system prune -a --volumes
	@echo "\033[0;32mRemoving local data folder\033[0m"
	@sudo rm -rf /home/anolivei/
	@echo "\033[0;32mRestoring etc/hosts\033[0m"
	@sudo mv ./hosts_backup /etc/hosts

.PHONY: all hosts down clean fclean
