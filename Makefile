.PHONY: build run

IMAGE_NAME=rtmp-server

build:
	@if [ -z "$$(docker images -q $(IMAGE_NAME))" ]; then \
		echo "Building $(IMAGE_NAME)..."; \
		docker build -t $(IMAGE_NAME) .; \
	else \
		echo "$(IMAGE_NAME) already exists, skipping build."; \
	fi

run: build
	docker run --rm --name rtmp-server -p 1935:1935 rtmp-server
