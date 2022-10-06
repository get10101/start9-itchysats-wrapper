VERSION := $(shell yq e ".version" manifest.yaml)
S9PK_PATH=$(shell find . -name itchysats.s9pk -print)
TS_FILES := $(shell find . -name \*.ts )
ASSET_PATHS := $(shell find ./assets/*)

.DELETE_ON_ERROR:

all: verify

verify: itchysats.s9pk $(S9PK_PATH)
	embassy-sdk verify s9pk $(S9PK_PATH)

install: all itchysats.s9pk
	embassy-cli package install itchysats.s9pk

clean:
	rm -f image.tar
	rm -f itchysats.s9pk

itchysats.s9pk: manifest.yaml image.tar instructions.md $(ASSET_PATHS) scripts/embassy.js
	embassy-sdk pack

image.tar: Dockerfile health-check.sh docker_entrypoint.sh
	DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build --tag start9/itchysats/main:$(VERSION) --platform=linux/arm64 -o type=docker,dest=image.tar .

scripts/embassy.js: $(TS_FILES)
	deno bundle scripts/embassy.ts scripts/embassy.js
