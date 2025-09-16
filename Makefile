.PHONY: up build down init demo backup logs clean reset
up:    ; docker compose up -d
build: ; docker compose up --build -d
down:  ; docker compose down
init:  ; bash scripts/init_db.sh yourerp
demo:  ; bash scripts/load_demo.sh yourerp
backup:; bash scripts/backup.sh yourerp
logs:  ; docker compose logs -f odoo
clean: ; docker compose down -v && docker system prune -f
reset: ; $(MAKE) clean && $(MAKE) build && $(MAKE) init && $(MAKE) demo

