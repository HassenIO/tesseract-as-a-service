compile:
	pip-compile --output-file=requirements.txt requirements.in &> /dev/null
.PHONY: compile

compile-dev:
	pip-compile --output-file=requirements-dev.txt requirements-dev.in requirements.in &> /dev/null
.PHONY: compile-dev

install-dev:
	pip install -r requirements-dev.txt
.PHONY: install-dev

format:
	python3 -m black .
.PHONY: format

check:
	python3 -m flake8 . && python3 -m black --check .
.PHONY: check

build: compile
	docker build -t tesseract-as-a-service:0.1.1 .
.PHONY: build

run:
	docker run --rm -p 5055:5055 --name tesseract-test tesseract-as-a-service:0.1.1
.PHONY: run
