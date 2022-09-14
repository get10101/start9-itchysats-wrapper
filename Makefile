VERSION := $(shell yq e ".version" manifest.yaml)
ITCHYSATS_SRC := $(shell find ./itchysats/src) itchysats/Cargo.toml itchysats/Cargo.lock
#CONFIGURATOR_SRC := $(shell find ./configurator/src) configurator/Cargo.toml configurator/Cargo.lock
S9PK_PATH=$(shell find . -name itchysats.s9pk -print)
TS_FILES := $(shell find . -name \*.ts )

.DELETE_ON_ERROR:

all: verify

verify: itchysats.s9pk $(S9PK_PATH)
	embassy-sdk verify s9pk $(S9PK_PATH)

install: all itchysats.s9pk
	embassy-cli package install electrs.s9pk

clean:
	rm -f image.tar
	rm -f itchysats.s9pk

itchysats.s9pk: manifest.yaml image.tar instructions.md scripts/embassy.js
	embassy-sdk pack

#image.tar: Dockerfile health-check.sh docker_entrypoint.sh configurator/target/aarch64-unknown-linux-musl/release/configurator $(ITCHYSATS_SRC)
image.tar: Dockerfile health-check.sh docker_entrypoint.sh $(ITCHYSATS_SRC)
	DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build --tag start9/itchysats/main:$(VERSION) --platform=linux/arm64 -o type=docker,dest=image.tar .

# TODO: Enable configuration
#configurator/target/aarch64-unknown-linux-musl/release/configurator: $(CONFIGURATOR_SRC)
	#docker run --rm -it -v ~/.cargo/registry:/root/.cargo/registry -v "$(shell pwd)"/configurator:/home/rust/src start9/rust-musl-cross:aarch64-musl cargo build --release

# TODO: Understand what TS files do and if this is needed
scripts/embassy.js: $(TS_FILES)
	deno bundle scripts/embassy.ts scripts/embassy.js
