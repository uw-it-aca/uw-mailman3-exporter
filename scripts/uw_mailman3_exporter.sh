#!/bin/sh

source /app/bin/activate

python /app/mailman_exporter.py -u "$MAILMAN_ADMIN_USER" -p "$MAILMAN_ADMIN_PASSWORD"
