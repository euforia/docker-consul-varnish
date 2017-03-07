#!/bin/sh

set -e

CT_BIN="consul-template"
V_BIN="varnishd"

sed -e "s/REPLACE/${SERVICE_NAME}/g" default.vcl.ctmpl.sed > default.vcl.ctmpl

${CT_BIN} -log-level DEBUG -consul-addr=${CONSUL_ADDR} \
    -template=/default.vcl.ctmpl:/etc/varnish/default.vcl \
    -exec "${V_BIN} -F -f /etc/varnish/default.vcl -s malloc,${CACHE_SIZE} -a 0.0.0.0:8080 ${VARNISHD_PARAMS}"
