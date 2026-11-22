#!/bin/sh
set -e
PORT="${PORT:-8080}"
: "${XRAY_UUID:?XRAY_UUID env var is required}"
: "${XRAY_WS_PATH:?XRAY_WS_PATH env var is required}"
sed -i "s/__PORT__/${PORT}/g; s/__UUID__/${XRAY_UUID}/g; s#__WS_PATH__#${XRAY_WS_PATH}#g" /etc/xray/config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
