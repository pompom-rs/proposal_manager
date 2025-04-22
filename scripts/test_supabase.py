#!/usr/bin/env python3
"""
Skript pro testování připojení k lokální Supabase instanci.
"""

import os
import sys
import asyncio
from dotenv import load_dotenv
from supabase import create_client, Client

# Přidání kořenového adresáře do PYTHONPATH
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

# Načtení proměnných prostředí z .env souboru
load_dotenv()

# Získání přístupových údajů
supabase_url = os.getenv("SUPABASE_URL", "http://localhost:8000")
supabase_key = os.getenv("SUPABASE_SERVICE_KEY", "")

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

async def test_connection():
    """
    Otestuje připojení k Supabase.
    """
    log_info(f"Testování připojení k Supabase na URL: {supabase_url}")
    
    if not supabase_key:
        log_error("SUPABASE_SERVICE_KEY není nastaven. Použijte .env soubor pro nastavení přístupových údajů.")
        return False
    
    try:
        # Vytvoření Supabase klienta
        supabase: Client = create_client(supabase_url, supabase_key)
        
        # Zkusíme získat verzi PostgreSQL
        try:
            response = await supabase.rpc('get_postgres_version').execute()
            if response.error:
                log_error(f"Chyba při testování připojení k Supabase: {response.error.message}")
                return False
                
            log_success(f"Připojení k Supabase úspěšné! PostgreSQL verze: {response.data}")
            return True
        except Exception as e:
            log_error(f"Chyba při volání RPC funkce: {str(e)}")
            
            # Zkusíme alternativní test - získání seznamu tabulek
            log_info("Zkouším alternativní test - získání seznamu tabulek...")
            response = await supabase.table('pg_catalog.pg_tables').select('schemaname,tablename').limit(5).execute()
            
            if response.error:
                log_error(f"Chyba při získávání seznamu tabulek: {response.error.message}")
                return False
                
            log_success(f"Připojení k Supabase úspěšné! Nalezeno {len(response.data)} tabulek.")
            return True
            
    except Exception as e:
        log_error(f"Chyba při připojování k Supabase: {str(e)}")
        return False

async def main():
    """
    Hlavní funkce.
    """
    log_info("Zahájení testování připojení k Supabase...")
    
    success = await test_connection()
    
    if success:
        log_success("Test připojení k Supabase byl úspěšný!")
        sys.exit(0)
    else:
        log_error("Test připojení k Supabase selhal!")
        log_info("Zkontrolujte, zda:")
        log_info("1. Vaše Supabase instance běží")
        log_info("2. Přístupové údaje v .env souboru jsou správné")
        log_info("3. Firewall neblokuje připojení")
        sys.exit(1)

if __name__ == "__main__":
    asyncio.run(main())
