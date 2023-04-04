package impl

import (
	authHandler "github.com/leonardoong/simple-ecommerce/internal/handler/http/auth"
	authUsecase "github.com/leonardoong/simple-ecommerce/internal/usecase/auth"

	"github.com/gin-gonic/gin"
)

type handler struct {
	authUsecase authUsecase.AuthUsecase
}

func New(router *gin.Engine, authUsecase authUsecase.AuthUsecase) authHandler.AuthHandler {
	h := &handler{
		authUsecase: authUsecase,
	}

	router.GET("/login", h.LoginHandler)

	router.POST("register", h.RegisterHandler)

	// router.GET("/logout", authHandler.LogoutHandler())

	return h
}
