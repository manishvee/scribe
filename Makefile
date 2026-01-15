IMAGE ?= scribe

.PHONY: build
build:
	@docker buildx build \
		--load \
		--compress \
		--build-arg USER_ID=$(shell id -u) \
		--build-arg USERNAME=$(shell id -un) \
		-t $(IMAGE) .

.PHONY: test
test:
	docker run --rm -it \
		-v .:/home/$(shell id -un)/.config \
                -w /home/$(shell id -un) \
		$(IMAGE)
