package impl

import (
	"github.com/jmoiron/sqlx"

	rAuth "github.com/leonardoong/simple-ecommerce/internal/repository/auth"
	"github.com/leonardoong/simple-ecommerce/internal/usecase/auth"
)

type authUsecase struct {
	db       sqlx.DB
	authRepo rAuth.AuthRepository
}

func New(
	db *sqlx.DB,
	authRepo rAuth.AuthRepository,
) auth.AuthUsecase {
	return &authUsecase{
		db:       *db,
		authRepo: authRepo,
	}
}
