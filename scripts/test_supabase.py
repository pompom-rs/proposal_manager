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
supabase_url = os.getenv("SUPABASE_URL", "http://localhost:8000")
supabase_key = os.getenv("SUPABASE_SERVICE_KEY", "")

# Kontrola a úprava URL
if supabase_url.endswith('/'):
    supabase_url = supabase_url[:-1]  # Odstranit koncové lomítko

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
        
        # Jednoduchý test připojení
        try:
            # Zkusíme získat informace o uživateli (anonymní přístup)
            response = await supabase.auth.get_user(supabase_key)
            log_success("Připojení k Supabase úspěšné!")
            
            # Nyní zkusíme zjistit, zda existuje schéma proposal_manager
            try:
                # Zkusíme získat seznam schémat
                response = await supabase.from('information_schema.schemata').select('schema_name').execute()
                
                if response.error:
                    log_error(f"Chyba při získávání seznamu schémat: {response.error.message}")
                else:
                    schemas = [item['schema_name'] for item in response.data]
                    if 'proposal_manager' in schemas:
                        log_success(f"Schéma proposal_manager existuje!")
                        
                        # Zkusíme získat seznam tabulek ve schémě proposal_manager
                        try:
                            response = await supabase.from('information_schema.tables').select('table_name').eq('table_schema', 'proposal_manager').execute()
                            
                            if response.error:
                                log_error(f"Chyba při získávání seznamu tabulek: {response.error.message}")
                            else:
                                tables = [item['table_name'] for item in response.data]
                                if tables:
                                    log_success(f"Schéma proposal_manager obsahuje {len(tables)} tabulek: {', '.join(tables[:5])}{' a další...' if len(tables) > 5 else ''}")
                                else:
                                    log_info("Schéma proposal_manager existuje, ale neobsahuje žádné tabulky. Spusťte SQL skript pro vytvoření tabulek.")
                        except Exception as e:
                            log_error(f"Chyba při získávání seznamu tabulek: {str(e)}")
                    else:
                        log_info(f"Schéma proposal_manager neexistuje. Dostupná schémata: {', '.join(schemas[:5])}{' a další...' if len(schemas) > 5 else ''}")
                        log_info("Spusťte SQL skript pro vytvoření schématu proposal_manager.")
            except Exception as e:
                log_error(f"Chyba při získávání seznamu schémat: {str(e)}")
                log_info("Spusťte SQL skript pro vytvoření schématu proposal_manager.")
            
            return True
        except Exception as e:
            log_error(f"Chyba při testování připojení k Supabase: {str(e)}")
            return False
            
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
