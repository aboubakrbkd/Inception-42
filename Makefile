up:
	docker-compose -f ./src/docker-compose.yml up --build

down:
	docker-compose -f ./src/docker-compose.yml down

clean: down
	docker system prune -af --volumes
re:clean up