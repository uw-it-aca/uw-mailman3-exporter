FROM python:3.9-alpine3.17 as uw-mailman3-exporter

RUN apk add --no-cache --upgrade bash

ARG USER=acait
RUN adduser -D $USER

WORKDIR /app

COPY . /app

RUN chown -R ${USER}:${USER} /app

USER $USER

RUN python3 -m venv /app/ &&\
    source /app/bin/activate &&\
    pip install --upgrade pip &&\
    pip install --no-cache-dir -r requirements.txt

EXPOSE 9091

CMD [ "bash", "/app/scripts/uw_mailman3_exporter.sh" ]
