FROM python:3.9.10-slim-buster

RUN apt update
RUN apt install -y tesseract-ocr

WORKDIR /tesseract-app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app/ app/
RUN mkdir tmp/

ENV PORT 8080
ENV PYTHONUNBUFFERED 1

EXPOSE 8080
CMD /usr/local/bin/python ./app/server.py
