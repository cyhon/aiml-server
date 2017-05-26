FROM docker.finogeeks.club/base/python-base:3.6.1

WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY . /app

CMD gunicorn -b 0.0.0.0:8080 main:app
