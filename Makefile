POSTGRES_PORT=5432
POSTGRES_DB=demo-db
POSTGRES_USER=demo-user
POSTGRES_PASSWORD=password

JUPYTER_HOST_PORT=8888

check_system:
	# System details
	@lsb_release -a

	# Docker components
	@docker --version
	@docker-compose --version

	# Pipenv version
	@pipenv --version

	# Pyenv version
	@pyenv --version


update_requirements:
	@echo "updating requirements"
	@pipenv lock -r > requirements.txt


run:
	@echo "running docker compose"
	JUPYTER_HOST_PORT=$(JUPYTER_HOST_PORT) 									\
	POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) 									\
	POSTGRES_PORT=$(POSTGRES_PORT) 											\
	POSTGRES_DB=$(POSTGRES_DB) 												\
	POSTGRES_USER=$(POSTGRES_USER) 											\
	docker-compose -f docker-compose/services.yml up --build --force-recreate


stop:
	@echo "running docker compose"
	JUPYTER_HOST_PORT=$(JUPYTER_HOST_PORT) 									\
	POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) 									\
	POSTGRES_PORT=$(POSTGRES_PORT) 											\
	POSTGRES_DB=$(POSTGRES_DB) 												\
	POSTGRES_USER=$(POSTGRES_USER) 											\
	docker-compose -f docker-compose/services.yml down


db_container_login:
	@echo "running docker compose"
	JUPYTER_HOST_PORT=$(JUPYTER_HOST_PORT) 									\
	POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) 									\
	POSTGRES_PORT=$(POSTGRES_PORT) 											\
	POSTGRES_DB=$(POSTGRES_DB) 												\
	POSTGRES_USER=$(POSTGRES_USER) 											\
	docker-compose -f docker-compose/services.yml 							\
	exec postgres /bin/bash -c "psql -h localhost -U${POSTGRES_USER} ${POSTGRES_DB}"

