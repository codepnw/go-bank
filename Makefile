build:
	@go build -o bin/gobank

run: build
	@./bin/gobank

test:
	@go test -v ./...

postgresinit:
	docker run --name gobank -e POSTGRES_USER=root -e POSTGRES_PASSWORD=123456 -p 5433:5432 -d postgres:15.4

postgres:
	docker exec -it gobank psql

createdb:
	docker exec -it gobank createdb gobank