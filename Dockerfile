FROM odoo:18.0

# Switch to root to add extra tools
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git nano && rm -rf /var/lib/apt/lists/*

# Back to odoo user
USER odoo
WORKDIR /var/lib/odoo

# Entrypoint and command are provided by the base image
