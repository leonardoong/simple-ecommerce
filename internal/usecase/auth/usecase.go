package auth

import (
	"context"

	"github.com/leonardoong/simple-ecommerce/internal/model"
)

type AuthUsecase interface {
	RegisterUser(ctx context.Context, req model.RegisterUserRequest) (res model.RegisterUserResponse, err error)
}
