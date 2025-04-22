# Makefile pro zjednodušení běžných vývojových úloh

.PHONY: setup dev test lint clean docker-up docker-down db-setup

# Nastavení vývojového prostředí
setup:
	@echo "Nastavení vývojového prostředí..."
	@./scripts/setup.sh

# Spuštění vývojového serveru
dev:
	@echo "Spouštění vývojového serveru..."
	@npm run dev

# Spuštění testů
test:
	@echo "Spouštění testů..."
	@./scripts/test.sh

# Spuštění lintingu
lint:
	@echo "Spouštění lintingu..."
	@./scripts/lint.sh

# Vyčištění dočasných souborů
clean:
	@echo "Čištění dočasných souborů..."
	@rm -rf frontend/dist
	@rm -rf frontend/node_modules
	@rm -rf backend/venv
	@rm -rf node_modules
	@find . -name "__pycache__" -type d -exec rm -rf {} +
	@find . -name "*.pyc" -delete
	@find . -name ".coverage" -delete
	@find . -name "htmlcov" -type d -exec rm -rf {} +
	@echo "Čištění dokončeno."

# Spuštění Docker kontejnerů
docker-up:
	@echo "Spouštění Docker kontejnerů..."
	@docker-compose up -d

# Zastavení Docker kontejnerů
docker-down:
	@echo "Zastavení Docker kontejnerů..."
	@docker-compose down

# Nastavení databáze
db-setup:
	@echo "Nastavení databáze..."
	@./scripts/db_setup.sh

# Nápověda
help:
	@echo "Dostupné příkazy:"
	@echo "  make setup      - Nastavení vývojového prostředí"
	@echo "  make dev        - Spuštění vývojového serveru"
	@echo "  make test       - Spuštění testů"
	@echo "  make lint       - Spuštění lintingu"
	@echo "  make clean      - Vyčištění dočasných souborů"
	@echo "  make docker-up  - Spuštění Docker kontejnerů"
	@echo "  make docker-down- Zastavení Docker kontejnerů"
	@echo "  make db-setup   - Nastavení databáze"
	@echo "  make help       - Zobrazení této nápovědy"
