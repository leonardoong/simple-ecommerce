-include .env

.PHONY: build

# Build
build: build-http

build-http:
	@echo " > Building [ecommerce]"
	@cd ./cmd/http/ && go build -o ../../bin.exe && cd ../..
	@echo " > Finished building [ecommerce]"

# Run
run-http: build-http
	@echo " > Running [ecommerce]"
	@bin.exe
	@echo " > Finished running [ecommerce]"

# Test
test:
	@echo " > Testing all..."
	@go test -race -cover ./
	@echo " > Finished Testing"