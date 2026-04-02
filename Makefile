#************************************************************************ VARIABLES
NGINX_CONTAINER = nginx
WORDPRESS_CONTAINER = wordpress
MARIADB_CONTAINER = mariadb

NAME		= inception
LOGIN		= lbegliom
HOSTNAME	= lbegliom
SRCS		= ./srcs
COMPOSE		= $(SRCS)/docker-compose.yml
HOST_URL	= $(LOGIN).42.fr
DATABASE_PATH	= /home/$(HOSTNAME)/data

#************************************************************************ RULES DOCKER COMPOSE

# Démarre les services existants sans recréer ni reconstruire quoi que ce soit.
start:
	@docker compose -f $(COMPOSE) start 

# Stop the application
stop:
	@docker compose -f $(COMPOSE) stop

# Stop and remove containers, networks
down:
	@docker compose -f $(COMPOSE) down

# Remove containers, networks, volumes, and images
clean:
	@docker compose -f $(COMPOSE) down --rmi all --volumes 

# remove all containers, networks, and images
fclean: clean
	@docker system prune -fa

logs:
	@docker compose -f $(COMPOSE) logs -f

#************************************************************************ MANAGEMENT
up:
	@mkdir -p $(DATABASE_PATH)/wordpress $(DATABASE_PATH)/mariadb $(DATABASE_PATH)/ssl
	@if [ ! -f $(DATABASE_PATH)/ssl/inception.crt ]; then \
		echo "Génération du certificat SSL..."; \
		openssl req -x509 -nodes -out $(DATABASE_PATH)/ssl/inception.crt \
		-keyout $(DATABASE_PATH)/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=$(HOST_URL)/UID=$(LOGIN)"; \
	else \
		echo "Certificat déja généré..."; \
	fi
	@sudo docker compose -f $(COMPOSE) up -d --build

delete_data_folder:
	@sudo rm -rf $(DATABASE_PATH)

#************************************************************************ ACCESS CONTAINERS

# Access MariaDB container
access_mariadb:
	@sudo docker exec -it $(MARIADB_CONTAINER) /bin/bash

# Access MariaDB container
access_wordpress:
	@sudo docker exec -it $(WORDPRESS_CONTAINER) /bin/bash

# Access Nginx container
access_nginx:
	@sudo docker exec -it $(NGINX_CONTAINER) /bin/bash

.PHONY: start stop down clean fclean logs up