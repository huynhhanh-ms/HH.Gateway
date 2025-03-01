docker run -d --name kong-database `
  --network=kong-net `
  -p 5432:5432 `
  -e "POSTGRES_USER=kong" `
  -e "POSTGRES_DB=kong" `
  -e "POSTGRES_PASSWORD=kongpass" `
  postgres:13


docker run --rm --network=kong-net `
 -e "KONG_DATABASE=postgres" `
 -e "KONG_PG_HOST=kong-database" `
 -e "KONG_PG_PASSWORD=kongpass" `
kong:3.9.0 kong migrations bootstrap


docker run -d --name kong-gateway `
 --network=kong-net `
 -e "KONG_DATABASE=postgres" `
 -e "KONG_PG_HOST=kong-database" `
 -e "KONG_PG_USER=kong" `
 -e "KONG_PG_PASSWORD=kongpass" `
 -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" `
 -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" `
 -e "KONG_PROXY_ERROR_LOG=/dev/stderr" `
 -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" `
 -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" `
 -e "KONG_ADMIN_GUI_URL=http://localhost:8002" `
 -p 8000:8000 `
 -p 8443:8443 `
 -p 127.0.0.1:8001:8001 `
 -p 127.0.0.1:8002:8002 `
 -p 127.0.0.1:8444:8444 `
 kong:3.9.0

docker kill kong-gateway
docker kill kong-database
docker container rm kong-gateway
docker container rm kong-database
docker network rm kong-net