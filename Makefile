postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -d postgres
createdb:
	docker exec -it postgres createdb --username=admin --owner=admin simplebank

dropdb:
	docker exec -it postgres dropdb --username=admin --password=admin simplebank

migratedown:
	migrate -path db/migration -database "postgres://admin:admin@localhost:5432/simplebank?sslmode=disable" -verbose down


migrateup:
	migrate -path db/migration -database "postgres://admin:admin@localhost:5432/simplebank?sslmode=disable" -verbose up

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc
