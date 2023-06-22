.DEFAULT_GOAL := help
.PHONY: develop-py develop-js develop-rust develop build-js build-py build-rust build lint-py lint-js lint-rust lint fix-py fix-js fix-rust fix checks-py checks-js checks-rust checks tests-py tests-js tests-rust tests test tests-ci help

develop-py:
	make -C python develop

develop-js:
	cd js; yarn

develop-rust:
	make -C rust develop

develop: develop-rust develop-js develop-py  ## Setup project for development

build-js:
	cd js; yarn build

build-py:
	make -C python build

build-rust:
	make -C rust build

build: build-rust build-js build-py  ## Build the project

lint-py:
	make -C python lint

lint-js:
	cd js; yarn lint

lint-rust:
	make -C rust lint

lint: lint-rust lint-js lint-py  ## Run project linters

fix-py:
	make -C python fix

fix-js:
	cd js; yarn fix

fix-rust:
	make -C rust fix

fix: fix-rust fix-js fix-py  ## Run project autofixers

checks-py:
	make -C python checks

checks-js:
	# noop

checks-rust:
	make -C rust checks

checks: checks-rust checks-js checks-py  ## Run any other checks

tests-py:
	make -C python tests

tests-js:
	cd js; yarn test

tests-rust:
	make -C rust tests

tests: tests-rust tests-js tests-py  ## Run the tests
test: tests

tests-ci-rust:
	make -C rust tests-ci

tests-ci: tests-ci-rust tests-py tests-js

# Thanks to Francoise at marmelab.com for this
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

print-%:
	@echo '$*=$($*)'
