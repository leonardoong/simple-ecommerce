package impl

import (
	"github.com/jmoiron/sqlx"

	rAuthRepo "github.com/leonardoong/simple-ecommerce/internal/repository/auth"
)

type authRepository struct {
	DB sqlx.DB
}

func NewAuthRepository(db sqlx.DB) rAuthRepo.AuthRepository {
	return *&authRepository{
		DB: db,
	}
}
