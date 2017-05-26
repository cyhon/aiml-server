FROM docker.finogeeks.club/base/python:2.7

WORKDIR /app

RUN apt-get update \
    && apt-get install -y python-pip \
    && export https_proxy=http://10.135.186.25:3128 \
    && pip install --upgrade pip \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY . /app

CMD gunicorn -b 0.0.0.0:8080 main:app
