#!/usr/bin/env python3
"""
Skript pro testování připojení k lokální Supabase instanci.
"""

import os
import sys

# Přidání kořenového adresáře do PYTHONPATH
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

# Pokus o import dotenv modulu, ale pokračovat i bez něj
try:
    from dotenv import load_dotenv
    # Načtení proměnných prostředí z .env souboru
    load_dotenv()
    print("Proměnné prostředí načteny z .env souboru.")
except ImportError:
    print("Modul 'dotenv' není nainstalovaný. Použijí se pouze proměnné prostředí systému.")
    print("Pro instalaci modulu spusťte: pip install python-dotenv")

# Získání přístupových údajů
supabase_url = os.getenv("SUPABASE_URL", "http://localhost:8000")
supabase_key = os.getenv("SUPABASE_SERVICE_KEY", "")

# Kontrola a úprava URL
if supabase_url.endswith('/'):
    supabase_url = supabase_url[:-1]  # Odstranit koncové lomítko

# Výpis aktuálních nastavení
print(f"Supabase URL: {supabase_url}")
print(f"Supabase Key: {'*' * (len(supabase_key) - 4) + supabase_key[-4:] if supabase_key else 'není nastaveno'}")

# Barvy pro výstup
GREEN = '\033[0;32m'
YELLOW = '\033[1;33m'
RED = '\033[0;31m'
NC = '\033[0m'  # No Color

def log_info(message):
    print(f"{YELLOW}INFO:{NC} {message}")

def log_success(message):
    print(f"{GREEN}SUCCESS:{NC} {message}")

def log_error(message):
    print(f"{RED}ERROR:{NC} {message}")

def test_connection_sync():
    """
    Synchronní test připojení k Supabase.
    """
    log_info(f"Testování připojení k Supabase na URL: {supabase_url}")
    
    if not supabase_key:
        log_error("SUPABASE_SERVICE_KEY není nastaven. Použijte .env soubor pro nastavení přístupových údajů.")
        return False
    
    try:
        # Jednoduchý test připojení - získání zdravotního stavu
        try:
            # Použijeme jednoduchý HTTP požadavek na zdravotní stav
            import requests
            health_url = f"{supabase_url}/rest/v1/"
            headers = {
                "apikey": supabase_key,
                "Authorization": f"Bearer {supabase_key}"
            }
            response = requests.get(health_url, headers=headers)
            
            if response.status_code == 200:
                log_success(f"Připojení k Supabase úspěšné! Status: {response.status_code}")
                return True
            else:
                log_error(f"Chyba při připojení k Supabase. Status: {response.status_code}, Odpověď: {response.text}")
                return False
        except Exception as e:
            log_error(f"Chyba při testování připojení k Supabase: {str(e)}")
            return False
            
    except Exception as e:
        log_error(f"Chyba při testování připojení k Supabase: {str(e)}")
        return False

def check_schema_exists():
    """
    Kontrola existence schématu proposal_manager.
    """
    log_info("Kontrola existence schématu proposal_manager...")
    
    log_info("Pro kontrolu existence schématu proposal_manager je potřeba spustit SQL skript.")
    log_info("Použijte SQL Editor v Supabase dashboardu a spusťte následující dotaz:")
    log_info("SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'proposal_manager';")
    
    log_info("Pro vytvoření schématu proposal_manager a tabulek použijte SQL skript v souboru backend/db/schema.sql.")
    return False

def main():
    """
    Hlavní funkce.
    """
    log_info("Zahájení testování připojení k Supabase...")
    
    # Kontrola, zda je nainstalován modul requests
    try:
        import requests
    except ImportError:
        log_error("Modul 'requests' není nainstalovaný. Pro instalaci spusťte: pip install requests")
        sys.exit(1)
    
    success = test_connection_sync()
    
    if success:
        log_success("Test připojení k Supabase byl úspěšný!")
        
        # Pokud je připojení úspěšné, zobrazíme informace o dalších krocích
        check_schema_exists()
        
        log_info("Pro vytvoření schématu proposal_manager a tabulek použijte SQL skript v souboru backend/db/schema.sql.")
        log_info("Spusťte tento skript v SQL Editoru v Supabase dashboardu.")
        
        sys.exit(0)
    else:
        log_error("Test připojení k Supabase selhal!")
        log_info("Zkontrolujte, zda:")
        log_info("1. Vaše Supabase instance běží")
        log_info("2. Přístupové údaje v .env souboru jsou správné")
        log_info("3. Firewall neblokuje připojení")
        sys.exit(1)

if __name__ == "__main__":
    main()
