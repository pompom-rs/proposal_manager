from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from jose import jwt
from pydantic import BaseModel
from typing import Optional
from .supabase import get_supabase_client

# Schéma pro autentizovaného uživatele
class User(BaseModel):
    id: str
    email: str
    role: Optional[str] = None

# Nastavení JWT Bearer tokenu
security = HTTPBearer()

async def get_current_user(credentials: HTTPAuthorizationCredentials = Depends(security)) -> User:
    """
    Získá aktuálního uživatele z JWT tokenu.
    
    Args:
        credentials: JWT token z hlavičky Authorization
        
    Returns:
        User: Objekt uživatele
        
    Raises:
        HTTPException: Pokud je token neplatný nebo uživatel neexistuje
    """
    token = credentials.credentials
    
    try:
        # Ověření JWT tokenu pomocí Supabase
        supabase = get_supabase_client()
        response = supabase.auth.get_user(token)
        user_data = response.user
        
        if not user_data:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Neplatný autentizační token",
                headers={"WWW-Authenticate": "Bearer"},
            )
        
        # Získání role uživatele z databáze
        user_response = supabase.table("users").select("role").eq("id", user_data.id).execute()
        role = user_response.data[0]["role"] if user_response.data else None
        
        return User(
            id=user_data.id,
            email=user_data.email,
            role=role
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail=f"Chyba při ověřování tokenu: {str(e)}",
            headers={"WWW-Authenticate": "Bearer"},
        )
