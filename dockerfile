FROM python:2.7-slim
MAINTAINER Herlan Biz <herlanbiz@gmail.com>

RUN apt-get update && apt-get install -qq -y \
  build-essential libpq-dev --no-install-recommends

ENV INSTALL_PATH /herlan-cms
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8082 --access-logfile - "herlan-cms.app:create_app()"