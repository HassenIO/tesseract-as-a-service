FROM python:3.9.10-slim-buster

RUN apt update
RUN apt install -y tesseract-ocr

WORKDIR /tesseract-app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app/ app/
RUN mkdir tmp/

EXPOSE 5000
ENTRYPOINT [ "/usr/local/bin/python", "-m", "awslambdaric" ]
CMD [ "app/server.handler" ]
