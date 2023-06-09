package model

type RegisterUserRequest struct {
	Username string `json:"username" binding:"required"`
	Password string `json:"password" binding:"required"`
}

type RegisterUserResponse struct {
	ResponseHeader ResponseHeader
	Username       string `json:"username"`
}
