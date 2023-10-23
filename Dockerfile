FROM python:3.9-alpine3.17

ARG USER=acait
RUN adduser -D $USER

WORKDIR /app

COPY mailman3_exporter  /app
COPY scripts/uw_mailman3_exporter.sh /app

RUN chown -R ${USER}:${USER} /app

USER $USER

RUN python3 -m venv /app/ &&\
    source /app/bin/activate &&\
    pip install --upgrade pip &&\
    pip install --no-cache-dir -r requirements.txt

EXPOSE 9091

CMD [ "python", "/app/uw_mailman3_exporter.py" ]
