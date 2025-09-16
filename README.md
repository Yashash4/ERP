# YourERP (Odoo CE 18.0 Fork)

## Quickstart

```bash
git clone <your-repo> yourerp
cd yourerp
# add upstream Odoo CE as submodule (once)
git submodule add -b 18.0 https://github.com/odoo/odoo addons/odoo

# dev up
docker compose up --build -d
# create DB + install base modules
bash scripts/init_db.sh
# load demo
bash scripts/load_demo.sh
```

## Structure

- addons/odoo → upstream CE (read-only)
- my_addons → your modules (write here)
- scripts → db init/demo/backup
- docker-compose.yml, Dockerfile, docker/odoo.conf

# ERP
