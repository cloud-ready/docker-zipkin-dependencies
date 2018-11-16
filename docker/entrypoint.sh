#!/bin/bash
set -ex

CRONTAB_EXPRESSION=${CRONTAB_EXPRESSION:-* */1 * * *}
CRONTAB_SCRIPT="bash /zipkin-dependencies.sh >> /data/logs/cron.log 2>&1"
echo "${CRONTAB_EXPRESSION} ${CRONTAB_SCRIPT}" > /data/zipkin-dependencies-cron

crontab /data/zipkin-dependencies-cron
crontab -l

sudo crond -f -l 8
