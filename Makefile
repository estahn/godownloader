.PHONY: install generate commit push all
.DEFAULT_GOAL := help

help: ## List targets & descriptions
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install godownloader
	go get -u github.com/goreleaser/godownloader

generate: ## Generate godownloader scripts
	godownloader --tree=tree

commit: ## Commit godownloader scripts
	git add .
	git commit -m 'chore: update godownloader scripts' .

push: ## Push godownloader scripts
	git push

all: install generate commit push
