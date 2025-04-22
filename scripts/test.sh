#!/bin/bash
# Skript pro spuštění testů

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

# Testy frontend
test_frontend() {
    log_info "Spouštění testů pro frontend..."
    
    cd frontend
    npm run test
    FRONTEND_RESULT=$?
    cd ..
    
    if [ $FRONTEND_RESULT -eq 0 ]; then
        log_success "Frontend testy úspěšně dokončeny."
    else
        log_error "Frontend testy selhaly."
        return 1
    fi
    
    return 0
}

# Testy backend
test_backend() {
    log_info "Spouštění testů pro backend..."
    
    cd backend
    source venv/bin/activate
    pytest
    BACKEND_RESULT=$?
    cd ..
    
    if [ $BACKEND_RESULT -eq 0 ]; then
        log_success "Backend testy úspěšně dokončeny."
    else
        log_error "Backend testy selhaly."
        return 1
    fi
    
    return 0
}

# Testy s pokrytím
test_coverage() {
    log_info "Spouštění testů s pokrytím pro frontend..."
    
    cd frontend
    npm run test:coverage
    cd ..
    
    log_info "Spouštění testů s pokrytím pro backend..."
    
    cd backend
    source venv/bin/activate
    pytest --cov=app --cov-report=html
    cd ..
    
    log_success "Testy s pokrytím dokončeny."
}

# Hlavní funkce
main() {
    log_info "Zahájení testování..."
    
    FRONTEND_OK=0
    BACKEND_OK=0
    
    test_frontend || FRONTEND_OK=1
    test_backend || BACKEND_OK=1
    
    if [ $FRONTEND_OK -eq 0 ] && [ $BACKEND_OK -eq 0 ]; then
        log_success "Všechny testy úspěšně dokončeny!"
        
        read -p "Chcete spustit testy s pokrytím? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            test_coverage
        fi
    else
        log_error "Některé testy selhaly. Opravte chyby a zkuste to znovu."
        exit 1
    fi
}

# Spuštění hlavní funkce
main
