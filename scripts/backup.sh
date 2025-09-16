#!/usr/bin/env bash
set -euo pipefail
DB=${1:-yourerp}
TS=$(date +%Y%m%d-%H%M%S)
mkdir -p backups

docker exec -t $(docker ps -qf "name=db") pg_dump -U ${POSTGRES_USER:-erp} "$DB" | gzip > backups/${DB}-${TS}.sql.gz

echo "Backup done: backups/${DB}-${TS}.sql.gz"

