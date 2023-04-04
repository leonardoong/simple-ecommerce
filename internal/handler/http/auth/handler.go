package auth

import "github.com/gin-gonic/gin"

type AuthHandler interface {
	RegisterHandler(c *gin.Context)
	LoginHandler(c *gin.Context)
}
