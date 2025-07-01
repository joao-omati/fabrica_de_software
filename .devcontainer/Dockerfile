FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    libpq-dev gcc curl netcat && \
    apt-get clean

WORKDIR /workspace

COPY . .

RUN pip install --upgrade pip
RUN pip install -r back/requirements.txt
