package model

import "time"

type User struct {
	UserID       int64     `json:"user_id" db:"user_id"`
	Username     string    `json:"username" db:"username"`
	ProfileImage string    `json:"profile_image" db:"profile_image"`
	Phone        string    `json:"phone" db:"phone"`
	Email        string    `json:"email" db:"email"`
	Password     string    `json:"password" db:"password"`
	CreatedAt    time.Time `json:"created_at" db:"created_at"`
	UpdatedAt    time.Time `json:"updated_at" db:"updated_at"`
}
