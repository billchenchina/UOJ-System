#!/usr/bin/env bash

set -Eeuo pipefail

mkdir -p log/
mkdir -p uoj_judger/data/

if [[ "${UOJ_PROTOCOL+x}" ]]; then
    jq --arg uoj_protocol "$UOJ_PROTOCOL" '. | .uoj_protocol = $uoj_protocol' conf/conf.json > \
    conf/conf.json.new && mv conf/conf.json.new conf/conf.json
fi

if [[ "${UOJ_HOST+x}" ]]; then
    jq --arg uoj_host "$UOJ_HOST" '. | .uoj_host = $uoj_host' conf/conf.json > \
    conf/conf.json.new && mv conf/conf.json.new conf/conf.json
fi

if [[ "${JUDGER_NAME+x}" ]]; then
    jq --arg judger_name "$JUDGER_NAME" '. | .judger_name = $judger_name' conf/conf.json > \
    conf/conf.json.new && mv conf/conf.json.new conf/conf.json
fi

if [[ "${JUDGER_PASSWORD+x}" ]]; then
    jq --arg judger_password "$JUDGER_PASSWORD" '. | .judger_password = $judger_password' conf/conf.json > \
    conf/conf.json.new && mv conf/conf.json.new conf/conf.json
fi

if [[ "${SOCKET_PORT+x}" ]]; then
    jq --arg socket_port "$SOCKET_PORT" '. | .socket_port = $socket_port' conf/conf.json > \
    conf/conf.json.new && mv conf/conf.json.new conf/conf.json
fi

if [[ "${SOCKET_PASSWORD+x}" ]]; then
    jq --arg socket_password "$SOCKET_PASSWORD" '. | .socket_password = $socket_password' conf/conf.json > \
    conf/conf.json.new && mv conf/conf.json.new conf/conf.json
fi


exec "$@"