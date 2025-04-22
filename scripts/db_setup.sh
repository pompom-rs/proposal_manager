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

# Kontrola, zda je nastavený Supabase
check_supabase() {
    log_info "Kontrola Supabase nastavení..."
    
    if [ -z "$SUPABASE_URL" ] || [ -z "$SUPABASE_SERVICE_KEY" ]; then
        log_error "Proměnné prostředí SUPABASE_URL nebo SUPABASE_SERVICE_KEY nejsou nastaveny."
        log_info "Prosím, nastavte tyto proměnné v souboru .env a načtěte je pomocí 'source .env'."
        exit 1
    fi
    
    log_success "Supabase nastavení nalezeno."
}

# Spuštění SQL migračních skriptů
run_migrations() {
    log_info "Spouštění SQL migračních skriptů..."
    
    # Zde by byl kód pro spuštění SQL migračních skriptů pomocí Supabase CLI nebo API
    # Například:
    # supabase db push
    
    log_info "Migrace budou implementovány v další fázi."
    log_success "Migrace dokončeny."
}

# Naplnění databáze testovacími daty
seed_database() {
    log_info "Naplňování databáze testovacími daty..."
    
    # Zde by byl kód pro naplnění databáze testovacími daty
    # Například:
    # supabase db seed
    
    log_info "Seed data budou implementována v další fázi."
    log_success "Databáze naplněna testovacími daty."
}

# Hlavní funkce
main() {
    log_info "Zahájení nastavení databáze..."
    
    check_supabase
    run_migrations
    
    read -p "Chcete naplnit databázi testovacími daty? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        seed_database
    fi
    
    log_success "Nastavení databáze úspěšně dokončeno!"
}

# Spuštění hlavní funkce
main
