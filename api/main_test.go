package api

import (
	"github.com/gin-gonic/gin"
	"github.com/hienphamm/simplebank/db/sqlc"
	"github.com/hienphamm/simplebank/util"
	"github.com/stretchr/testify/require"
	"os"
	"testing"
	"time"
)

func newTestServer(t *testing.T, store sqlc.Store) *Server {
	config := util.Config{
		TokenSymmetricKey:   util.RandomString(32),
		AccessTokenDuration: time.Minute,
	}

	server, err := NewServer(config, store)
	require.NoError(t, err)

	return server
}

func TestMain(t *testing.M) {
	gin.SetMode(gin.TestMode)
	os.Exit(t.Run())
}
