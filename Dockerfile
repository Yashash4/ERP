FROM python:3.10-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential python3-dev libpq-dev libxml2-dev libxslt1-dev \
    libjpeg-dev zlib1g-dev libffi-dev curl nodejs npm git \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir wheel psycopg2-binary
COPY addons/odoo/requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && pip install --no-cache-dir gevent
RUN useradd -ms /bin/bash odoo
USER odoo
WORKDIR /home/odoo
ENTRYPOINT ["/usr/local/bin/python"]
CMD ["-m", "odoo"]

