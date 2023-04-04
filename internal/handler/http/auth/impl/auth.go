package impl

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"

	"github.com/leonardoong/simple-ecommerce/internal/model"
	m "github.com/leonardoong/simple-ecommerce/internal/model"
)

func (h *handler) LoginHandler(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "test",
	})
}

func (h *handler) RegisterHandler(c *gin.Context) {
	var (
		req       m.RegisterUserRequest
		startTime = time.Now()
	)

	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	resp, err := h.authUsecase.RegisterUser(c, model.RegisterUserRequest{
		Username: req.Username,
		Password: req.Password,
	})

	if err != nil {
		resp = m.RegisterUserResponse{
			ResponseHeader: m.ResponseHeader{
				Success:        false,
				ProcessingTime: float64(time.Now().Sub(startTime)),
				ErrorCode:      resp.ResponseHeader.ErrorCode,
				ErrorMessage:   resp.ResponseHeader.ErrorMessage,
			},
		}
		c.JSON(http.StatusInternalServerError, resp)
	}

	resp = m.RegisterUserResponse{
		ResponseHeader: m.ResponseHeader{
			Success:        true,
			ProcessingTime: float64(time.Now().Sub(startTime)),
		},
		Username: resp.Username,
	}

	c.JSON(http.StatusOK, resp)
}
