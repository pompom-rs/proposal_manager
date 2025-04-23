# Dokumentace skriptů

Tento dokument obsahuje podrobný popis skriptů v adresáři `/scripts` a návod, jak je používat.

## Přehled dostupných skriptů

V adresáři `/scripts` jsou k dispozici následující skripty:

1. `setup.sh` - Inicializace vývojového prostředí
2. `lint.sh` - Spuštění lintingu pro frontend a backend
3. `test.sh` - Spuštění testů pro frontend a backend
4. `db_setup.sh` - Nastavení databáze pro lokální Supabase instanci
5. `test_supabase.py` - Testování připojení k lokální Supabase instanci

## Jak používat skripty

### Příprava

Před použitím skriptů je potřeba:

1. Ujistit se, že máte nainstalované všechny potřebné nástroje:
   - Node.js (verze 16+)
   - npm
   - Python 3.9+
   - pip
   - Git

2. Nastavit spustitelná práva pro skripty (pokud již nejsou nastavena):
   ```bash
   chmod +x scripts/*.sh
   chmod +x scripts/*.py
   ```

### 1. Inicializace vývojového prostředí (`setup.sh`)

Tento skript inicializuje vývojové prostředí pro projekt Proposal Manager. Provede následující kroky:
- Kontrola požadavků (Node.js, npm, Python, pip)
- Vytvoření virtuálního prostředí pro Python
- Instalace Python závislostí
- Instalace Node.js závislostí
- Vytvoření `.env` souboru z `.env.example`

**Použití:**
```bash
./scripts/setup.sh
```

**Příklad výstupu:**
```
INFO: Zahájení nastavení vývojového prostředí...
INFO: Kontrola požadavků...
SUCCESS: Všechny požadavky splněny.
INFO: Vytváření virtuálního prostředí pro Python...
SUCCESS: Virtuální prostředí vytvořeno.
INFO: Aktivace virtuálního prostředí...
INFO: Instalace Python závislostí...
SUCCESS: Python prostředí nastaveno.
INFO: Instalace Node.js závislostí...
SUCCESS: Node.js závislosti nainstalovány.
INFO: Vytváření .env souboru...
SUCCESS: .env soubor vytvořen. Prosím, upravte jej podle vašich potřeb.
SUCCESS: Vývojové prostředí úspěšně nastaveno!
```

### 2. Spuštění lintingu (`lint.sh`)

Tento skript spustí linting pro frontend a backend. Kontroluje kvalitu kódu a formátování podle nastavených pravidel.

**Použití:**
```bash
./scripts/lint.sh
```

**Příklad výstupu:**
```
INFO: Zahájení lintingu...
INFO: Spouštění lintingu pro frontend...
SUCCESS: Frontend linting dokončen.
INFO: Spouštění lintingu pro backend...
INFO: Spouštění black...
INFO: Spouštění isort...
INFO: Spouštění flake8...
INFO: Spouštění mypy...
SUCCESS: Backend linting dokončen.
SUCCESS: Linting úspěšně dokončen!
```

### 3. Spuštění testů (`test.sh`)

Tento skript spustí testy pro frontend a backend. Ověří, že kód funguje správně a splňuje očekávané chování.

**Použití:**
```bash
./scripts/test.sh
```

**Příklad výstupu:**
```
INFO: Zahájení testování...
INFO: Spouštění testů pro frontend...
SUCCESS: Frontend testy úspěšně dokončeny.
INFO: Spouštění testů pro backend...
SUCCESS: Backend testy úspěšně dokončeny.
SUCCESS: Všechny testy úspěšně dokončeny!
Chcete spustit testy s pokrytím? (y/n) y
INFO: Spouštění testů s pokrytím pro frontend...
INFO: Spouštění testů s pokrytím pro backend...
SUCCESS: Testy s pokrytím dokončeny.
```

### 4. Nastavení databáze (`db_setup.sh`)

Tento skript pomáhá s nastavením databáze pro lokální Supabase instanci. Provede následující kroky:
- Načtení proměnných prostředí z `.env` souboru
- Kontrola Supabase nastavení
- Testování připojení k Supabase
- Zobrazení instrukcí pro spuštění SQL migračních skriptů
- Zobrazení instrukcí pro naplnění databáze testovacími daty

**Použití:**
```bash
./scripts/db_setup.sh
```

**Příklad výstupu:**
```
INFO: Zahájení nastavení databáze...
INFO: Načítání proměnných prostředí z .env souboru...
SUCCESS: Proměnné prostředí načteny z .env souboru.
INFO: Kontrola Supabase nastavení...
SUCCESS: Supabase nastavení nalezeno.
INFO: Testování připojení k Supabase...
INFO: Zahájení testování připojení k Supabase...
INFO: Testování připojení k Supabase na URL: http://localhost:8000
SUCCESS: Připojení k Supabase úspěšné! PostgreSQL verze: 15.1
SUCCESS: Test připojení k Supabase byl úspěšný!
SUCCESS: Připojení k Supabase úspěšné.
INFO: Spouštění SQL migračních skriptů...
INFO: Skript pro vytvoření databázového schématu je připraven.
INFO: Pro spuštění skriptu přejděte do Supabase dashboardu na adrese:
INFO: http://localhost:8000
INFO: a v sekci 'SQL Editor' spusťte obsah souboru backend/db/schema.sql.
Chcete zobrazit obsah SQL skriptu? (y/n) n
SUCCESS: Instrukce pro migraci dokončeny.
Chcete zobrazit instrukce pro naplnění databáze testovacími daty? (y/n) y
INFO: Naplňování databáze testovacími daty...
INFO: Pro naplnění databáze testovacími daty můžete použít následující postup:
INFO: 1. Přejděte do Supabase dashboardu na adrese: http://localhost:8000
INFO: 2. V sekci 'Table Editor' vyberte tabulku, kterou chcete naplnit daty
INFO: 3. Klikněte na 'Insert Row' a zadejte testovací data
SUCCESS: Instrukce pro seed data dokončeny.
SUCCESS: Nastavení databáze úspěšně dokončeno!
INFO: Nyní můžete pokračovat s vývojem aplikace.
```

### 5. Testování připojení k Supabase (`test_supabase.py`)

Tento skript testuje připojení k lokální Supabase instanci. Ověří, že je možné se připojit k Supabase a provádět základní operace.

**Použití:**
```bash
python3 scripts/test_supabase.py
```

**Příklad výstupu:**
```
INFO: Zahájení testování připojení k Supabase...
INFO: Testování připojení k Supabase na URL: http://localhost:8000
SUCCESS: Připojení k Supabase úspěšné! PostgreSQL verze: 15.1
SUCCESS: Test připojení k Supabase byl úspěšný!
```

## Použití skriptů pomocí Makefile

Pro zjednodušení práce se skripty je k dispozici také Makefile, který poskytuje pohodlné příkazy pro běžné úlohy:

```bash
# Nastavení vývojového prostředí
make setup

# Spuštění vývojového serveru
make dev

# Spuštění testů
make test

# Spuštění lintingu
make lint

# Vyčištění dočasných souborů
make clean

# Spuštění Docker kontejnerů
make docker-up

# Zastavení Docker kontejnerů
make docker-down

# Nastavení databáze
make db-setup

# Zobrazení nápovědy
make help
```

## Řešení problémů

### Skript nelze spustit

Pokud se zobrazí chyba "Permission denied" při pokusu o spuštění skriptu, ujistěte se, že má skript nastavena spustitelná práva:

```bash
chmod +x scripts/název_skriptu.sh
```

### Chyba při připojení k Supabase

Pokud se zobrazí chyba při připojení k Supabase, zkontrolujte:

1. Zda je Supabase instance spuštěna
2. Zda jsou správně nastaveny proměnné prostředí v `.env` souboru:
   ```
   SUPABASE_URL=http://localhost:8000
   SUPABASE_PUBLIC_KEY=your-anon-key
   SUPABASE_SERVICE_KEY=your-service-key
   ```
3. Zda není blokováno připojení firewallem

### Chyba při instalaci závislostí

Pokud se zobrazí chyba při instalaci závislostí, zkontrolujte:

1. Zda máte nainstalovanou správnou verzi Node.js a Python
2. Zda máte přístup k internetu pro stažení balíčků
3. Zda máte dostatečná oprávnění pro instalaci balíčků

## Další informace

Pro více informací o jednotlivých skriptech se podívejte do jejich zdrojového kódu, kde jsou podrobné komentáře vysvětlující jejich funkci.
