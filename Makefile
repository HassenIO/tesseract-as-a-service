build:
	docker build -f dockerfiles/Dockerfile.local -t tesseract-as-a-service:0.1.1 .
.PHONY: build

run:
	docker run --rm -p 5055:5055 --name tesseract-test tesseract-as-a-service:0.1.1
.PHONY: run

compile:
	pip-compile --output-file=requirements.txt requirements.in &> /dev/null
.PHONY: compile
