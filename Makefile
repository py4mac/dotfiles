SHELL=/bin/bash -o pipefail

.PHONY: build
build:
	docker build -t virtual-env .