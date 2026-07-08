#!/bin/sh
# Genera env-config.js a partir de variables de entorno del contenedor.
# Permite que la SPA (ya compilada) conozca en runtime las URLs públicas
# de los backends sin tener que reconstruir la imagen (12-factor config).
set -eu

: "${BACK_VENTAS_URL:=http://localhost:8080}"
: "${BACK_DESPACHOS_URL:=http://localhost:8081}"

export BACK_VENTAS_URL BACK_DESPACHOS_URL

envsubst '${BACK_VENTAS_URL} ${BACK_DESPACHOS_URL}' \
  < /usr/share/nginx/html/env-config.template.js \
  > /usr/share/nginx/html/env-config.js
