# enforces rebuild1
.PHONY: all test clean lint lint-black lint-flake8 fmt
IMAGE_NAME=python-project
VERSION = 0.0.1
LOCAL_PROFILE=default

test:
	poetry run pytest \
		-v -p no:warnings \
		tests/

lint: lint-black lint-flake8

lint-black:
	poetry run black --check src tests

lint-flake8:
	poetry run flake8 --config=.flake8 src tests

fmt:
	poetry run black src tests

clean:
	rm dist/*.whl
	rm dist/*.tar.gz

build:
	poetry build

run: build
	poetry run run-script

docker-build:
	@docker build --rm -t ${IMAGE_NAME}:${VERSION} .
	docker tag ${IMAGE_NAME}:${VERSION} ${IMAGE_NAME}:latest

docker-run: docker-build
	docker run --rm -p 8000:8000 ${IMAGE_NAME}:latest