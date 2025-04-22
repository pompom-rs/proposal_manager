import os
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
    SUPABASE_URL: str = os.getenv("SUPABASE_URL", "")
    SUPABASE_KEY: str = os.getenv("SUPABASE_KEY", "")
    
    # OpenAI
    OPENAI_API_KEY: str = os.getenv("OPENAI_API_KEY", "")
    
    # Nastavení CORS
    BACKEND_CORS_ORIGINS: list = ["*"]
    
    class Config:
        case_sensitive = True

settings = Settings()
