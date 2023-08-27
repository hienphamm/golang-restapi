package sqlc

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

var testQueries *Queries

const (
	driverName     = "postgres"
	dataSourceName = "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable"
)

func TestMain(t *testing.M) {
	conn, err := sql.Open(driverName, dataSourceName)
	if err != nil {
		log.Fatal("Cannot connect to database:", err)
	}
	testQueries = New(conn)
	os.Exit(t.Run())
}
