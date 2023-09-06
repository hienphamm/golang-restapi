postgres14:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=Edward@2602! -d postgres:14-alpine

startdocker:
	docker start postgres14

createdb:
	docker exec -it postgres14 createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgres14 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://postgres:Edward@2602!@localhost:5432/simple_bank?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://postgres:Edward@2602!@localhost:5432/simple_bank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://postgres:Edward@2602!@localhost:5432/simple_bank?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://postgres:Edward@2602!@localhost:5432/simple_bank?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/hienphamm/simplebank/db/sqlc Store

.PHONY: postgres14 createdb dropdb migrateup migratedown migrateup1 migratedown1 sqlc startdocker server mock