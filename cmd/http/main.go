package main

import (
	"github.com/leonardoong/simple-ecommerce/internal/common/db"
)

func main() {

	ecommerceDB := db.ConnectDB()

	usecase := initUsecase(ecommerceDB)
	router := newRoutes(usecase)

	router.Run(":8080")
}
