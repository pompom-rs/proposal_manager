#!/bin/bash
# Skript pro nastavení databáze

# Barvy pro výstup
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Funkce pro výpis zpráv
log_info() {
    echo -e "${YELLOW}INFO:${NC} $1"
}

log_success() {
    echo -e "${GREEN}SUCCESS:${NC} $1"
}

log_error() {
    echo -e "${RED}ERROR:${NC} $1"
}

# Načtení proměnných prostředí z .env souboru
load_env() {
    log_info "Načítání proměnných prostředí z .env souboru..."
    
    if [ -f ".env" ]; then
        source .env
        log_success "Proměnné prostředí načteny z .env souboru."
    else
        log_error ".env soubor nenalezen. Použijte .env.example jako šablonu."
        exit 1
    fi
}

# Kontrola, zda je nastavený Supabase
check_supabase() {
    log_info "Kontrola Supabase nastavení..."
    
    if [ -z "$SUPABASE_URL" ] || [ -z "$SUPABASE_SERVICE_KEY" ]; then
        log_error "Proměnné prostředí SUPABASE_URL nebo SUPABASE_SERVICE_KEY nejsou nastaveny."
        log_info "Prosím, nastavte tyto proměnné v souboru .env."
        exit 1
    fi
    
    log_success "Supabase nastavení nalezeno."
}

# Testování připojení k Supabase
test_connection() {
    log_info "Testování připojení k Supabase..."
    
    python3 scripts/test_supabase.py
    if [ $? -ne 0 ]; then
        log_error "Test připojení k Supabase selhal. Ukončuji."
        exit 1
    fi
    
    log_success "Připojení k Supabase úspěšné."
}

# Spuštění SQL migračních skriptů
run_migrations() {
    log_info "Spouštění SQL migračních skriptů..."
    
    # Kontrola, zda existuje SQL skript
    if [ ! -f "backend/db/schema.sql" ]; then
        log_error "SQL skript backend/db/schema.sql nenalezen."
        exit 1
    fi
    
    log_info "Skript pro vytvoření databázového schématu je připraven."
    log_info "Pro spuštění skriptu přejděte do Supabase dashboardu na adrese:"
    log_info "$SUPABASE_URL"
    log_info "a v sekci 'SQL Editor' spusťte obsah souboru backend/db/schema.sql."
    
    read -p "Chcete zobrazit obsah SQL skriptu? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cat backend/db/schema.sql
    fi
    
    log_success "Instrukce pro migraci dokončeny."
}

# Naplnění databáze testovacími daty
seed_database() {
    log_info "Naplňování databáze testovacími daty..."
    
    # Zde by byl kód pro naplnění databáze testovacími daty
    # V této fázi pouze zobrazíme instrukce
    
    log_info "Pro naplnění databáze testovacími daty můžete použít následující postup:"
    log_info "1. Přejděte do Supabase dashboardu na adrese: $SUPABASE_URL"
    log_info "2. V sekci 'Table Editor' vyberte tabulku, kterou chcete naplnit daty"
    log_info "3. Klikněte na 'Insert Row' a zadejte testovací data"
    
    log_success "Instrukce pro seed data dokončeny."
}

# Hlavní funkce
main() {
    log_info "Zahájení nastavení databáze..."
    
    load_env
    check_supabase
    test_connection
    run_migrations
    
    read -p "Chcete zobrazit instrukce pro naplnění databáze testovacími daty? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        seed_database
    fi
    
    log_success "Nastavení databáze úspěšně dokončeno!"
    log_info "Nyní můžete pokračovat s vývojem aplikace."
}

# Spuštění hlavní funkce
main
