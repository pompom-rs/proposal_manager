#!/bin/bash
# Skript pro spuštění lintingu

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

# Lint frontend
lint_frontend() {
    log_info "Spouštění lintingu pro frontend..."
    
    cd frontend
    npm run lint
    npm run format
    cd ..
    
    log_success "Frontend linting dokončen."
}

# Lint backend
lint_backend() {
    log_info "Spouštění lintingu pro backend..."
    
    cd backend
    source venv/bin/activate
    
    log_info "Spouštění black..."
    black app tests
    
    log_info "Spouštění isort..."
    isort app tests
    
    log_info "Spouštění flake8..."
    flake8 app tests
    
    log_info "Spouštění mypy..."
    mypy app
    
    cd ..
    
    log_success "Backend linting dokončen."
}

# Hlavní funkce
main() {
    log_info "Zahájení lintingu..."
    
    lint_frontend
    lint_backend
    
    log_success "Linting úspěšně dokončen!"
}

# Spuštění hlavní funkce
main
