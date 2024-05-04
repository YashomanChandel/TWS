DOCKER_COMPOSE := docker-compose

OS := $(uname)

build:
	@echo "Running in $(OS)"
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

clean:
	docker system prune
