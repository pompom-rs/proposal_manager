#!/usr/bin/env python3
"""
Skript pro testování připojení k lokální Supabase instanci.
"""

import os
import sys
import asyncio

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

# Import Supabase klienta
try:
    from supabase import create_client, Client
except ImportError:
    print("Modul 'supabase' není nainstalovaný. Pro instalaci spusťte: pip install supabase")
    sys.exit(1)

# Získání přístupových údajů
supabase_url = os.getenv("SUPABASE_URL", "http://localhost:8800")
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

        # Zkusíme získat verzi PostgreSQL z proposal_manager schémy
        try:
            response = await supabase.rpc('proposal_manager.get_postgres_version').execute()
            if response.error:
                log_error(f"Chyba při testování připojení k Supabase s proposal_manager schémou: {response.error.message}")
                log_info("Zkusím získat verzi PostgreSQL bez schémy...")

                # Zkusíme získat verzi PostgreSQL bez schémy
                response = await supabase.rpc('get_postgres_version').execute()
                if response.error:
                    log_error(f"Chyba při testování připojení k Supabase: {response.error.message}")
                    return False

                log_success(f"Připojení k Supabase úspěšné! PostgreSQL verze: {response.data}")
                log_info("Schéma proposal_manager není dostupné. Spusťte SQL skript pro vytvoření schématu.")
                return True

            log_success(f"Připojení k Supabase úspěšné! PostgreSQL verze: {response.data} (schéma proposal_manager)")
            return True
        except Exception as e:
            log_error(f"Chyba při volání RPC funkce: {str(e)}")

            # Zkusíme alternativní test - získání seznamu tabulek ve schémě proposal_manager
            log_info("Zkouším alternativní test - získání seznamu tabulek ve schémě proposal_manager...")
            response = await supabase.table('pg_catalog.pg_tables').select('schemaname,tablename').eq('schemaname', 'proposal_manager').execute()

            if response.error:
                log_error(f"Chyba při získávání seznamu tabulek: {response.error.message}")

                # Zkusíme získat seznam všech tabulek
                log_info("Zkouším získat seznam všech tabulek...")
                response = await supabase.table('pg_catalog.pg_tables').select('schemaname,tablename').limit(5).execute()

                if response.error:
                    log_error(f"Chyba při získávání seznamu tabulek: {response.error.message}")
                    return False

                log_success(f"Připojení k Supabase úspěšné! Nalezeno {len(response.data)} tabulek.")
                log_info("Schéma proposal_manager není dostupné nebo neobsahuje žádné tabulky. Spusťte SQL skript pro vytvoření schématu.")
                return True

            if len(response.data) == 0:
                log_info("Schéma proposal_manager existuje, ale neobsahuje žádné tabulky. Spusťte SQL skript pro vytvoření tabulek.")
                return True

            log_success(f"Připojení k Supabase úspěšné! Nalezeno {len(response.data)} tabulek ve schémě proposal_manager.")
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
