SOURCES := $(shell find ./src -name '*.rs')
TARGET  := ./target/mips-unknown-linux-musl/debug/rust_musl_build_demo

.PHONY: all
all: $(TARGET)

$(TARGET): $(SOURCES) docker-build
	docker run -it --rm \
		-v $(shell pwd):/home/rusty/rust-musl-build-demo \
		-w /home/rusty/rust-musl-build-demo rust-musl-build-demo \
		cargo build --target mips-unknown-linux-musl

.PHONY: docker-build
docker-build:
	DOCKER_BUILDKIT=1 docker build -t rust-musl-build-demo .

.PHONY: clean
clean:
	rm -rf ./target