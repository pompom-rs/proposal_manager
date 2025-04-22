import os
import json
from typing import List
from pydantic import BaseSettings
from dotenv import load_dotenv

# Načtení proměnných prostředí z .env souboru
load_dotenv()

class Settings(BaseSettings):
    """Konfigurace aplikace"""

    # Základní nastavení aplikace
    APP_NAME: str = "Proposal Manager API"
    API_V1_STR: str = "/api/v1"

    # Supabase
    SUPABASE_URL: str = os.getenv("SUPABASE_URL", "http://localhost:8000")
    SUPABASE_KEY: str = os.getenv("SUPABASE_SERVICE_KEY", "")

    # OpenAI
    OPENAI_API_KEY: str = os.getenv("OPENAI_API_KEY", "")

    # Zabezpečení
    SECRET_KEY: str = os.getenv("SECRET_KEY", "tajny-klic-pro-vyvoj")

    # Nastavení CORS
    BACKEND_CORS_ORIGINS: List[str] = []

    class Config:
        case_sensitive = True

# Zpracování CORS nastavení
cors_origins_env = os.getenv("BACKEND_CORS_ORIGINS", '["http://localhost:3000", "http://localhost:8080"]')
try:
    cors_origins = json.loads(cors_origins_env)
    if isinstance(cors_origins, list):
        settings = Settings(BACKEND_CORS_ORIGINS=cors_origins)
    else:
        settings = Settings()
        print("BACKEND_CORS_ORIGINS musí být seznam. Používám výchozí hodnoty.")
except json.JSONDecodeError:
    settings = Settings()
    print(f"Chyba při parsování BACKEND_CORS_ORIGINS: {cors_origins_env}. Používám výchozí hodnoty.")

# Kontrola nastavení Supabase
if not settings.SUPABASE_KEY:
    print("VAROVANÍ: SUPABASE_SERVICE_KEY není nastaven. Použijte .env soubor pro nastavení přístupových údajů.")
