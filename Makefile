postgres:
	docker run --name postgres --network bank-network -p 5432:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -d postgres
createdb:
	docker exec -it postgres createdb --username=admin --owner=admin simplebank

dropdb:
	docker exec -it postgres dropdb --username=admin --password=admin simplebank

migratedown:
	migrate -path db/migration -database "postgres://admin:admin@localhost:5432/simplebank?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgres://admin:admin@localhost:5432/simplebank?sslmode=disable" -verbose down 1


migrateup:
	migrate -path db/migration -database "postgres://admin:admin@localhost:5432/simplebank?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgres://admin:admin@localhost:5432/simplebank?sslmode=disable" -verbose up 1


sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	 mockgen -destination db/mock/store.go github.com/kamalweheliye/simplebank/db/sqlc/ Store

.PHONY: postgres createdb dropdb migrateup migrateup1 migratedown migratedown1 sqlc test server mock
