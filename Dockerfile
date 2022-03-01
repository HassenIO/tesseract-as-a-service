FROM python:3.9.10-slim-buster

RUN apt update
RUN apt install -y tesseract-ocr
