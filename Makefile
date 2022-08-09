VERSION := $(shell git describe --always |sed -e "s/^v//")

devshell:
	docker-compose run --rm chirpstack-udp-forwarder bash
build:
	docker-compose run -e BINDGEN_EXTRA_CLANG_ARGS="--sysroot=/usr/aarch64-linux-gnu" --rm chirpstack-udp-forwarder cargo build --target aarch64-unknown-linux-gnu --release
test:
	docker-compose run --rm chirpstack-udp-forwarder cargo test
