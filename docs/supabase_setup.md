# Nastavení Supabase projektu

Tento dokument obsahuje instrukce pro vytvoření a konfiguraci Supabase projektu pro aplikaci Proposal Manager.

## Registrace na Supabase

1. Navštivte [Supabase](https://supabase.com/) a klikněte na tlačítko "Start your project"
2. Vytvořte účet pomocí GitHub, Google nebo e-mailu
3. Potvrďte svůj e-mail, pokud je to vyžadováno

## Vytvoření nového projektu

1. Po přihlášení klikněte na tlačítko "New Project"
2. Vyberte organizaci nebo vytvořte novou
3. Zadejte následující údaje:
   - **Name**: `proposal-manager` (nebo jiný název dle vašeho výběru)
   - **Database Password**: Vygenerujte silné heslo a bezpečně si ho uložte
   - **Region**: Vyberte region nejblíže vašim uživatelům (např. `eu-central-1` pro Evropu)
   - **Pricing Plan**: Začněte s Free plánem pro vývoj

4. Klikněte na "Create new project"
5. Počkejte, až se projekt vytvoří (může to trvat několik minut)

## Získání přístupových údajů

Po vytvoření projektu budete potřebovat přístupové údaje pro připojení aplikace k Supabase:

1. V dashboardu projektu přejděte do sekce "Settings" > "API"
2. Zkopírujte následující údaje:
   - **Project URL**: `https://[project-id].supabase.co`
   - **anon/public key**: Veřejný klíč pro klientské aplikace
   - **service_role key**: Tajný klíč pro serverové aplikace (používejte pouze na serveru!)

3. Vytvořte soubor `.env` v kořenovém adresáři projektu a přidejte tyto údaje:

```
SUPABASE_URL=https://[project-id].supabase.co
SUPABASE_PUBLIC_KEY=your-anon-public-key
SUPABASE_SERVICE_KEY=your-service-role-key
```

**Poznámka**: Soubor `.env` je přidán do `.gitignore`, aby se citlivé údaje nedostaly do repozitáře.

## Nastavení databázového schématu

Databázové schéma bude vytvořeno pomocí SQL migračních skriptů v dalších krocích implementace.

## Nastavení autentizace

1. V dashboardu Supabase přejděte do sekce "Authentication" > "Providers"
2. Povolte "Email" autentizaci
3. Volitelně povolte "Google" OAuth provider:
   - Vytvořte OAuth aplikaci v [Google Cloud Console](https://console.cloud.google.com/)
   - Nastavte redirect URL na `https://[project-id].supabase.co/auth/v1/callback`
   - Zkopírujte Client ID a Client Secret do nastavení Google provideru v Supabase

## Další kroky

Po dokončení těchto kroků budete mít připravený Supabase projekt pro vývoj aplikace Proposal Manager. V dalších krocích implementace vytvoříme databázové schéma a nastavíme autentizaci v aplikaci.
