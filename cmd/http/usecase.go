package main

import (
	"github.com/jmoiron/sqlx"
	authRepoImpl "github.com/leonardoong/simple-ecommerce/internal/repository/auth/impl"
	authUsecase "github.com/leonardoong/simple-ecommerce/internal/usecase/auth"
	authUsecaseImpl "github.com/leonardoong/simple-ecommerce/internal/usecase/auth/impl"
)

type Usecase struct {
	AuthUsecase authUsecase.AuthUsecase
}

func initUsecase(db *sqlx.DB) Usecase {
	return Usecase{
		AuthUsecase: initAuthUsecase(db),
	}
}

func initAuthUsecase(db *sqlx.DB) authUsecase.AuthUsecase {
	// repo
	authRepo := authRepoImpl.NewAuthRepository(*db)

	return authUsecaseImpl.New(*db, authRepo)
}
