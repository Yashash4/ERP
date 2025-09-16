#!/usr/bin/env bash
set -euo pipefail
DB=${1:-yourerp}

python - <<'PY'
from odoo.modules.registry import Registry
from odoo import api, SUPERUSER_ID
import os
DB = os.environ.get('DB','yourerp')
with api.Environment.manage():
    registry = Registry(DB)
    with registry.cursor() as cr:
        env = api.Environment(cr, SUPERUSER_ID, {})
        Partner = env['res.partner']
        if not Partner.search([('name','=','Demo Customer')]):
            Partner.create({'name':'Demo Customer','email':'demo@example.com'})
        Product = env['product.product']
        if not Product.search([('default_code','=','SKU-1')]):
            Product.create({'name':'Demo Product 1','list_price':999,'default_code':'SKU-1'})
        cr.commit()
print('Demo data loaded')
PY

