#!/bin/bash

source /app/bin/activate

MAILMAN_REST_URL="http://${HOSTNAME::-2}:80"

python /app/scripts/mailman_ready.py -m "$MAILMAN_REST_URL"

python /app/mailman_exporter.py -l "localhost:9091" -m "$MAILMAN_REST_URL"  -u "$MAILMAN_ADMIN_USER" -p "$MAILMAN_ADMIN_PASSWORD"
