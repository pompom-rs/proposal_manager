# Nastavení lokální Supabase instance v Dockeru

Tento dokument obsahuje instrukce pro nastavení a konfiguraci lokální Supabase instance běžící v Dockeru pro aplikaci Proposal Manager.

## Předpoklady

- Docker a Docker Compose jsou nainstalovány na vašem systému
- Máte již běžící lokální instanci Supabase v Dockeru

## Připojení k existující Supabase instanci

### 1. Získání přístupových údajů

Pokud máte již běžící instanci Supabase, potřebujete získat následující přístupové údaje:

- **Supabase URL**: Typicky `http://localhost:8000` (nebo jiný port, na kterém běží vaše instance)
- **Supabase Anon Key**: Veřejný klíč pro klientské aplikace
- **Supabase Service Key**: Tajný klíč pro serverové aplikace

Tyto údaje můžete najít v konfiguračních souborech vaší Supabase instance nebo v Supabase dashboardu na adrese `http://localhost:8000/project/default`.

### 2. Konfigurace přístupových údajů v aplikaci

Vytvořte soubor `.env` v kořenovém adresáři projektu a přidejte tyto údaje:

```
# Supabase
SUPABASE_URL=http://localhost:8000
SUPABASE_PUBLIC_KEY=your-anon-key
SUPABASE_SERVICE_KEY=your-service-key

# OpenAI
OPENAI_API_KEY=your-openai-api-key

# Backend
BACKEND_CORS_ORIGINS=["http://localhost:3000","http://localhost:8080"]
SECRET_KEY=your-secret-key-for-jwt-tokens

# Frontend
VITE_API_URL=http://localhost:8000/api/v1
VITE_SUPABASE_URL=http://localhost:8000
VITE_SUPABASE_PUBLIC_KEY=your-anon-key
```

**Poznámka**: Soubor `.env` je přidán do `.gitignore`, aby se citlivé údaje nedostaly do repozitáře.

## Vytvoření nové Supabase instance v Dockeru (volitelné)

Pokud ještě nemáte běžící instanci Supabase, můžete ji vytvořit následujícím způsobem:

### 1. Klon Supabase Docker repozitáře

```bash
git clone https://github.com/supabase/supabase-docker.git
cd supabase-docker
```

### 2. Spuštění Supabase

```bash
docker-compose up -d
```

Tento příkaz spustí všechny potřebné služby Supabase (PostgreSQL, PostgREST, GoTrue, Realtime, Storage, Kong, atd.).

### 3. Přístup k Supabase dashboardu

Po spuštění všech služeb můžete přistupovat k Supabase dashboardu na adrese:

```
http://localhost:8000
```

Výchozí přihlašovací údaje jsou:
- **Email**: `admin@admin.com`
- **Password**: `admin`

### 4. Získání přístupových údajů

Po přihlášení do dashboardu přejděte do sekce "Settings" > "API" a zkopírujte následující údaje:

- **URL**: `http://localhost:8000`
- **anon/public key**: Veřejný klíč pro klientské aplikace
- **service_role key**: Tajný klíč pro serverové aplikace

## Nastavení databázového schématu

Pro vytvoření databázového schématu podle návrhu aplikace Proposal Manager můžete použít následující postup:

### 1. Přístup k SQL editoru

V Supabase dashboardu přejděte do sekce "SQL Editor".

### 2. Vytvoření tabulek

Vytvořte nový SQL dotaz a vložte do něj SQL kód pro vytvoření tabulek podle návrhu v souboru `proposal_manager_design.md`. Například:

```sql
-- Vytvoření tabulky users
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  username TEXT NOT NULL UNIQUE,
  email TEXT NOT NULL UNIQUE,
  role TEXT NOT NULL CHECK (role IN ('admin', 'manager', 'user')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky clients
CREATE TABLE clients (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  description TEXT,
  contact_person TEXT,
  email TEXT,
  phone TEXT,
  address TEXT,
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Další tabulky podle návrhu...
```

### 3. Nastavení Row Level Security (RLS)

Pro zabezpečení dat nastavte Row Level Security pro každou tabulku. Například:

```sql
-- Povolení RLS pro tabulku users
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- Vytvoření policy pro tabulku users
CREATE POLICY "Users can view their own data" ON users
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Admins can view all users" ON users
  FOR SELECT USING (auth.jwt() ->> 'role' = 'admin');
```

## Nastavení autentizace

### 1. Konfigurace autentizačních providerů

V Supabase dashboardu přejděte do sekce "Authentication" > "Providers":

1. Povolte "Email" autentizaci
2. Volitelně povolte "Google" OAuth provider (vyžaduje nastavení v Google Cloud Console)

### 2. Konfigurace autentizace v aplikaci

Pro použití Supabase autentizace v aplikaci jsou již připraveny následující soubory:

- **Backend**: `backend/app/core/supabase.py` a `backend/app/core/auth.py`
- **Frontend**: `frontend/src/services/supabase.js` a `frontend/src/services/auth.js`

Tyto soubory jsou nakonfigurovány tak, aby používaly přístupové údaje z `.env` souboru.

## Testování připojení

Pro ověření, že vaše aplikace je správně připojena k lokální Supabase instanci, můžete použít následující postup:

### 1. Spuštění backendu

```bash
cd backend
source venv/bin/activate
uvicorn app.main:app --reload
```

### 2. Spuštění frontendu

```bash
cd frontend
npm run dev
```

### 3. Testování autentizace

Otevřete aplikaci v prohlížeči a zkuste se přihlásit pomocí emailu a hesla. Pokud je vše správně nakonfigurováno, měli byste být schopni se přihlásit a přistupovat k databázi.

## Další kroky

Po dokončení těchto kroků budete mít připravenou lokální Supabase instanci pro vývoj aplikace Proposal Manager. V dalších krocích implementace vytvoříme databázové schéma a implementujeme autentizaci v aplikaci.
