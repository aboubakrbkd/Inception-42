up:
	docker-compose -f ./src/docker-compose.yml up -d

down:
	docker-compose -f ./src/docker-compose.yml down

clean:
	docker system prune -af --volumes