build:
	docker build -t tesseract-test:0.1.1 .

run:
	docker run --rm -p 5000:5000 --name tesseract-test tesseract-test:0.1.1

