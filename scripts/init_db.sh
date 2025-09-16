#!/usr/bin/env bash
set -euo pipefail
DB=${1:-yourerp}

# Wait for Odoo to be ready
until curl -sf http://localhost:8069 >/dev/null; do
  echo "Waiting for Odoo (8069)…"; sleep 2;
done

echo "Creating DB: $DB"
python -m odoo -d "$DB" -i base --without-demo=all --stop-after-init \
  --db_host=db --db_user=${POSTGRES_USER:-erp} --db_password=${POSTGRES_PASSWORD:-erp} \
  -c /etc/odoo/odoo.conf

echo "Installing modules: web_theme,d2c_core,shopify_sync"
python -m odoo -d "$DB" -i web_theme,d2c_core,shopify_sync --stop-after-init \
  --db_host=db --db_user=${POSTGRES_USER:-erp} --db_password=${POSTGRES_PASSWORD:-erp} \
  -c /etc/odoo/odoo.conf

echo "DB ready: $DB"

