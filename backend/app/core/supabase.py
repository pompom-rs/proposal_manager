from supabase import create_client, Client
from .config import settings

# Vytvoření Supabase klienta
supabase: Client = create_client(
    settings.SUPABASE_URL,
    settings.SUPABASE_KEY
)

def get_supabase_client() -> Client:
    """
    Vrátí instanci Supabase klienta pro použití v API endpointech.
    """
    return supabase
