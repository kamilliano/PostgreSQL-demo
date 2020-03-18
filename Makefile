PORT=5432
POSTGRES_PASSWORD=password

run:
	@ echo "starting postgres on port=$(PORT)"
	@docker run -it -p $(PORT):$(PORT) -e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) postgres

connect:
	@
	@docker exec -it $(shell docker ps | awk '{ print $$1,$$2 }' | grep postgres | awk '{print $$1 }') /bin/bash -c "psql -h localhost -U postgres"

stop:
	@ echo "stopping postgres"
	@docker stop $(shell docker ps | awk '{ print $$1,$$2 }' | grep postgres | awk '{print $$1 }')