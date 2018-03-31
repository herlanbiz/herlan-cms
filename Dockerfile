FROM python:2.7-slim
MAINTAINER David Agustian <agustian42@gmail.com>
RUN apt-get update && apt-get install -qq -y \
  build-essential libpq-dev --no-install-recommends
ENV INSTALL_PATH /web_app01
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD gunicorn -b 0.0.0.0:5000 --access-logfile - "web_app01.app:create_app()"