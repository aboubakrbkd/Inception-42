up:
	mkdir -p /home/aboubakr/Desktop/wordpress
	docker-compose -f ./src/docker-compose.yml up --build

down:
	docker-compose -f ./src/docker-compose.yml down

clean: down
	rm -rf /home/aboubakr/Desktop/wordpress
	docker system prune -af --volumes
re:clean up