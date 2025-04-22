#!/bin/bash
# Skript pro inicializaci vývojového prostředí

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

# Kontrola, zda jsou nainstalované potřebné nástroje
check_requirements() {
    log_info "Kontrola požadavků..."
    
    if ! command -v node &> /dev/null; then
        log_error "Node.js není nainstalován. Prosím, nainstalujte Node.js (verze 16+)."
        exit 1
    fi
    
    if ! command -v npm &> /dev/null; then
        log_error "npm není nainstalován. Prosím, nainstalujte npm."
        exit 1
    fi
    
    if ! command -v python3 &> /dev/null; then
        log_error "Python 3 není nainstalován. Prosím, nainstalujte Python 3.9+."
        exit 1
    fi
    
    if ! command -v pip &> /dev/null; then
        log_error "pip není nainstalován. Prosím, nainstalujte pip."
        exit 1
    fi
    
    log_success "Všechny požadavky splněny."
}

# Vytvoření virtuálního prostředí pro Python
setup_python_env() {
    log_info "Vytváření virtuálního prostředí pro Python..."
    
    if [ -d "backend/venv" ]; then
        log_info "Virtuální prostředí již existuje. Přeskakuji..."
    else
        cd backend
        python3 -m venv venv
        cd ..
        log_success "Virtuální prostředí vytvořeno."
    fi
    
    log_info "Aktivace virtuálního prostředí..."
    source backend/venv/bin/activate
    
    log_info "Instalace Python závislostí..."
    pip install -r backend/requirements.txt
    
    log_success "Python prostředí nastaveno."
}

# Instalace Node.js závislostí
setup_node_env() {
    log_info "Instalace Node.js závislostí..."
    
    npm install
    
    log_info "Instalace frontend závislostí..."
    cd frontend
    npm install
    cd ..
    
    log_success "Node.js závislosti nainstalovány."
}

# Vytvoření .env souboru
setup_env_file() {
    log_info "Vytváření .env souboru..."
    
    if [ -f ".env" ]; then
        log_info ".env soubor již existuje. Přeskakuji..."
    else
        cp .env.example .env
        log_success ".env soubor vytvořen. Prosím, upravte jej podle vašich potřeb."
    fi
}

# Hlavní funkce
main() {
    log_info "Zahájení nastavení vývojového prostředí..."
    
    check_requirements
    setup_python_env
    setup_node_env
    setup_env_file
    
    log_success "Vývojové prostředí úspěšně nastaveno!"
    log_info "Nyní můžete spustit aplikaci pomocí 'npm run dev'"
}

# Spuštění hlavní funkce
main
