from supabase import create_client, Client
from .config import settings
import logging

# Nastavení loggeru
logger = logging.getLogger(__name__)

# Vytvoření Supabase klienta
try:
    supabase: Client = create_client(
        settings.SUPABASE_URL,
        settings.SUPABASE_KEY
    )
    logger.info(f"Supabase klient vytvořen pro URL: {settings.SUPABASE_URL}")
except Exception as e:
    logger.error(f"Chyba při vytváření Supabase klienta: {str(e)}")
    # Vytvoření prázdného klienta pro případ chyby
    supabase = None

def get_supabase_client() -> Client:
    """
    Vrátí instanci Supabase klienta pro použití v API endpointech.

    Returns:
        Client: Supabase klient nebo None v případě chyby

    Raises:
        Exception: Pokud není Supabase klient inicializován
    """
    if supabase is None:
        raise Exception("Supabase klient není inicializován. Zkontrolujte přístupové údaje v .env souboru.")
    return supabase

# Funkce pro testování připojení k Supabase
async def test_connection() -> bool:
    """
    Otestuje připojení k Supabase.

    Returns:
        bool: True pokud je připojení úspěšné, jinak False
    """
    try:
        if supabase is None:
            return False

        # Zkusíme získat verzi PostgreSQL
        response = await supabase.rpc('get_postgres_version').execute()
        if response.error:
            logger.error(f"Chyba při testování připojení k Supabase: {response.error.message}")
            return False

        logger.info(f"Připojení k Supabase úspěšné: {response.data}")
        return True
    except Exception as e:
        logger.error(f"Chyba při testování připojení k Supabase: {str(e)}")
        return False
