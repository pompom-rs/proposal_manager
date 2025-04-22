# Proposal Manager

Proposal Manager je aplikace pro správu a automatizaci tvorby návrhů projektů pomocí AI agentů. Aplikace umožňuje zpracování požadavků klientů, návrh architektury, plánování projektu a generování finálních návrhů.

## Funkce

- **Správa projektů a klientů** - Přehledná správa všech projektů a klientů s možností filtrování a vyhledávání
- **Analýza požadavků** - Automatická analýza požadavků z nahraných dokumentů pomocí AI
- **Návrh architektury** - Generování a vizualizace architektury systému na základě požadavků
- **Plánování projektu** - Automatické vytváření rozpočtů, časových os a milníků
- **Generování návrhů** - Tvorba profesionálních návrhů s možností exportu do PDF a DOCX
- **Šablony** - Knihovna šablon pro rychlé vytváření nových projektů
- **Responzivní design** - Plná podpora mobilních zařízení
- **Tmavý režim** - Možnost přepínání mezi světlým a tmavým režimem

## Technologie

- **Frontend**: Vue.js s Vuetify
- **Backend**: Python s FastAPI
- **Databáze**: Supabase (PostgreSQL)
- **Autentizace**: Supabase Auth s podporou OAuth
- **AI**: Integrace s OpenAI API
- **Vizualizace**: Chart.js, Vue Gantt

## Požadavky

- Node.js 16+
- Python 3.9+
- Docker a Docker Compose (volitelné)
- Účet Supabase
- Účet OpenAI API

## Instalace

### Lokální vývoj

1. Klonujte repozitář:
   ```
   git clone https://github.com/your-username/proposal-manager.git
   cd proposal-manager
   ```

2. Nastavení backendu:
   ```
   cd backend
   python -m venv venv
   source venv/bin/activate  # Na Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```

3. Nastavení frontendu:
   ```
   cd ../frontend
   npm install
   ```

4. Vytvořte soubor `.env` v kořenovém adresáři projektu a nastavte potřebné proměnné prostředí:
   ```
   # Supabase
   SUPABASE_URL=your-supabase-url
   SUPABASE_KEY=your-supabase-key
   
   # OpenAI
   OPENAI_API_KEY=your-openai-api-key
   ```

5. Spuštění backendu:
   ```
   cd backend
   uvicorn app.main:app --reload
   ```

6. Spuštění frontendu:
   ```
   cd frontend
   npm run dev
   ```

### Použití Docker Compose

1. Klonujte repozitář:
   ```
   git clone https://github.com/your-username/proposal-manager.git
   cd proposal-manager
   ```

2. Vytvořte soubor `.env` v kořenovém adresáři projektu a nastavte potřebné proměnné prostředí.

3. Spusťte aplikaci pomocí Docker Compose:
   ```
   docker-compose up -d
   ```

## Struktura projektu

```
proposal-manager/
├── backend/                # FastAPI backend
│   ├── app/
│   │   ├── api/            # API endpointy
│   │   ├── core/           # Konfigurace a nastavení
│   │   ├── db/             # Databázové modely a migrace
│   │   ├── services/       # Byznys logika
│   │   └── main.py         # Hlavní aplikační soubor
│   ├── tests/              # Testy
│   └── requirements.txt    # Python závislosti
├── frontend/               # Vue.js frontend
│   ├── public/             # Statické soubory
│   ├── src/
│   │   ├── assets/         # Obrázky a styly
│   │   ├── components/     # Vue komponenty
│   │   ├── router/         # Vue Router
│   │   ├── store/          # Vuex store
│   │   ├── views/          # Stránky aplikace
│   │   └── main.js         # Hlavní aplikační soubor
│   └── package.json        # Node.js závislosti
├── docker-compose.yml      # Docker Compose konfigurace
└── README.md               # Dokumentace projektu
```

## Vývoj

### Konvence kódu

- **Backend**: Používáme Black pro formátování kódu a Flake8 pro linting
- **Frontend**: Používáme ESLint a Prettier pro formátování kódu

### Workflow

1. Vytvořte novou větev pro každou funkci nebo opravu
2. Implementujte změny a přidejte testy
3. Vytvořte pull request
4. Po schválení a úspěšných testech proveďte merge do hlavní větve

## Licence

Tento projekt je licencován pod MIT licencí - viz soubor [LICENSE](LICENSE) pro detaily.
