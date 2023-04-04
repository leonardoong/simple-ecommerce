package main

import (
	authHandlerImpl "github.com/leonardoong/simple-ecommerce/internal/handler/http/auth/impl"

	"github.com/gin-gonic/gin"
)

func newRoutes(usecase Usecase) *gin.Engine {

	router := gin.Default()

	router.MaxMultipartMemory = 8 << 20
	authHandlerImpl.New(router, usecase.AuthUsecase)

	return router
}
