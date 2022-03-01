build:
	docker build -t tesseract-test:0.1.0 .

run:
	docker run --rm -it tesseract-test:0.1.0 /bin/bash

