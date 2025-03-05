up:
	docker compose down
	docker compose up -d --build
down:
	docker compose down
logs:
	docker compose logs -f 

down-start:
	docker kill kong-gateway
	docker kill kong-database
	docker container rm kong-gateway
	docker container rm kong-database
	docker network rm kong_net