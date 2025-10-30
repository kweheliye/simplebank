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


proto:
	rm -f pb/*.go
	rm -f doc/swagger/*.swagger.json
	protoc --proto_path=proto --go_out=pb --go_opt=paths=source_relative \
	--go-grpc_out=pb --go-grpc_opt=paths=source_relative \
	--grpc-gateway_out=pb --grpc-gateway_opt=paths=source_relative \
	--openapiv2_out=doc/swagger --openapiv2_opt=allow_merge=true,merge_file_name=simple_bank \
	proto/*.proto

evans:
	evans -p 9090 -r repl

.PHONY: postgres createdb dropdb migrateup migrateup1 migratedown migratedown1 sqlc test server mock proto evans
