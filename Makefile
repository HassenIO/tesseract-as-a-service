build:
	docker build -t tesseract-as-a-service:0.1.1 .

run:
	docker run --rm -p 5055:5055 --name tesseract-test tesseract-as-a-service:0.1.1

