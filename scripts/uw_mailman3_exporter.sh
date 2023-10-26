#!/bin/bash

source /app/bin/activate

python /app/mailman_exporter.py -l "localhost:9091" -m "${HOSTNAME::-2}:80"  -u "$MAILMAN_ADMIN_USER" -p "$MAILMAN_ADMIN_PASSWORD" --log-level=debug
