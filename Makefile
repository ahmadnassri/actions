#!/usr/bin/make

pull: ## pull latest containers
	@docker compose pull

lint: ## run mega-linter
	@docker compose run --rm lint

readme: ## generate root README.md
	@docker compose run --rm readme

clean: ## delete containers, images, volumes
	@docker compose rm --stop --force --volumes
	@docker compose down --remove-orphans --volumes --rmi local

# Utility methods
## Help: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help: ## display this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
.PHONY: help all clean test
