init:
	./scripts/syncapiserver.sh
	./scripts/generatecerts.sh
	go mod tidy

local:
	./scripts/start.sh