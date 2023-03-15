package main

import (
	"github.com/gin-gonic/gin"
	authHandler "github.com/leonardoong/simple-ecommerce/internal/handler"
)

func main() {

	router := gin.Default()

	router.GET("/login", authHandler.LoginHandler)
	// router.GET("/logout", authHandler.LogoutHandler())

	router.Run(":8080")
}
