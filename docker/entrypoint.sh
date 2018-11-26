#!/bin/bash
set -ex

set -f
CRONTAB_SCRIPT="bash /zipkin-dependencies.sh >> /data/logs/cron.log 2>&1"
echo "${CRONTAB_EXPRESSION:-0 */1 * * *} ${CRONTAB_SCRIPT}" > /data/zipkin-dependencies-cron
set +f

crontab /data/zipkin-dependencies-cron
crontab -l

sudo crond -f -l 8
