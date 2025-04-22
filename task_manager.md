# Proposal Manager - Tracker úloh

Tento soubor slouží jako tracker úloh pro implementaci aplikace Proposal Manager. AI agent bude používat tento soubor k označení rozpracovaných a dokončených úloh a k zaznamenání poznámek o provedených úpravách a rozšířeních.

## Legenda
- [ ] Nerozpracovaná úloha
- [⚙️] Rozpracovaná úloha (Started)
- [✅] Dokončená úloha (Completed)
- [❌] Neaplikovatelná úloha (Not Applicable)

---

## Fáze 0: Příprava projektu a vývojového prostředí (1 týden)

### Základní struktura projektu
- [✅] **P0-1**: Inicializace Git repozitáře pro verzování kódu
  - Poznámky: Git repozitář byl úspěšně inicializován v kořenovém adresáři projektu. Výchozí větev byla přejmenována na 'main' místo 'master' podle moderních konvencí.

- [✅] **P0-2**: Vytvoření README.md s popisem projektu a instrukcemi pro instalaci
  - Poznámky: Vytvořen README.md soubor s podrobným popisem projektu, seznamem funkcí, použitých technologií, požadavků, instrukcí pro instalaci a vývoj, strukturou projektu a licencí.

- [✅] **P0-3**: Nastavení základní adresářové struktury pro frontend a backend
  - Poznámky: Vytvořena základní adresářová struktura pro frontend (Vue.js s Vuetify) a backend (FastAPI). Přidány základní soubory pro konfiguraci, routování a UI komponenty. Vytvořeny Dockerfile a docker-compose.yml pro kontejnerizaci aplikace.

- [✅] **P0-4**: Vytvoření .gitignore souboru pro ignorování nepotřebných souborů
  - Poznámky: Vytvořen komplexní .gitignore soubor, který ignoruje dočasné soubory, závislosti (node_modules, venv), soubory s citlivými údaji (.env), cache a build adresáře, a soubory specifické pro různé operační systémy.

- [✅] **P0-5**: Nastavení editorconfig a linting pravidel pro konzistentní kód
  - Poznámky: Vytvořen .editorconfig soubor pro konzistentní formátování kódu napříč editory. Nakonfigurovány linting pravidla pro frontend (ESLint, Prettier) a backend (Flake8, Black, isort, mypy). Nastavená pravidla zajistí jednotný styl kódu a pomohou odhalit potenciální chyby.

### Nastavení vývojového prostředí
- [✅] **P0-6**: Registrace a vytvoření Supabase projektu
  - Poznámky: Vytvořena dokumentace s podrobnými instrukcemi pro registraci a vytvoření Supabase projektu v souboru docs/supabase_setup.md. Dokumentace obsahuje kroky pro registraci, vytvoření projektu, získání přístupových údajů a nastavení autentizace.

- [✅] **P0-7**: Konfigurace přístupových údajů k Supabase
  - Poznámky: Vytvořeny konfigurační soubory pro přístup k Supabase v backendu (app/core/supabase.py) a frontendu (services/supabase.js). Implementovány služby pro autentizaci uživatelů v obou částech aplikace. Vytvořen vzor .env souboru (.env.example) s potřebnými proměnnými prostředí.

- [✅] **P0-8**: Nastavení vývojových nástrojů a závislostí
  - Poznámky: Nakonfigurovány vývojové nástroje a závislosti pro frontend (Vite, Vitest, ESLint, Prettier) a backend (Pytest, Black, Flake8, MyPy). Vytvořeny základní testovací soubory pro obě části aplikace. Aktualizovány package.json a requirements.txt s potřebnými závislostmi. Přidán hlavní package.json pro spuštění vývojových příkazů.

- [✅] **P0-9**: Vytvoření skriptů pro automatizaci vývojových úloh
  - Poznámky: Vytvořeny skripty pro automatizaci vývojových úloh v adresáři scripts/: setup.sh pro inicializaci vývojového prostředí, lint.sh pro kontrolu kódu, test.sh pro spuštění testů a db_setup.sh pro nastavení databáze. Skripty mají nastavené spustitelné práva a obsahují podrobné logování a ošetření chyb.

- [✅] **P0-10**: Nastavení prostředí pro lokální vývoj
  - Poznámky: Vytvořen Makefile pro zjednodušení běžných vývojových úloh (setup, dev, test, lint, clean, docker-up, docker-down, db-setup). Nakonfigurováno prostředí VS Code pomocí souborů v adresáři .vscode/ (settings.json, extensions.json, launch.json) pro snadný vývoj a ladění aplikace.

---

## Fáze 1: Základní infrastruktura (2 týdny)

### Frontend setup
- [ ] **F1-1**: Inicializace Vue.js projektu s Vite
  - Poznámky:

- [ ] **F1-2**: Instalace a konfigurace Vuetify
  - Poznámky:

- [ ] **F1-3**: Nastavení základní struktury projektu (složky components, views, store, router)
  - Poznámky:

- [ ] **F1-4**: Implementace základního layoutu s responzivním designem
  - Poznámky:

- [ ] **F1-5**: Vytvoření komponent pro navigační sidebar s ikonami
  - Poznámky:

- [ ] **F1-6**: Implementace přepínání mezi tmavým a světlým režimem
  - Poznámky:

- [ ] **F1-7**: Vytvoření breadcrumb navigace
  - Poznámky:

- [ ] **F1-8**: Nastavení základních CSS proměnných a stylů
  - Poznámky:

### Backend setup
- [ ] **B1-1**: Inicializace FastAPI projektu
  - Poznámky:

- [ ] **B1-2**: Nastavení struktury projektu (složky routes, models, services, utils)
  - Poznámky:

- [ ] **B1-3**: Konfigurace CORS pro komunikaci s frontendem
  - Poznámky:

- [ ] **B1-4**: Implementace základních middleware (autentizace, logování)
  - Poznámky:

- [ ] **B1-5**: Nastavení Pydantic modelů pro validaci dat
  - Poznámky:

### Databáze a autentizace
- [ ] **D1-1**: Implementace databázového schématu podle návrhu
  - Poznámky:

- [ ] **D1-2**: Vytvoření uživatelských rolí a oprávnění
  - Poznámky:

- [ ] **D1-3**: Konfigurace Supabase Auth s podporou OAuth (Google)
  - Poznámky:

- [ ] **D1-4**: Nastavení Row Level Security (RLS) pro zabezpečení dat
  - Poznámky:

- [ ] **D1-5**: Vytvoření základních databázových migrací
  - Poznámky:

### Propojení a základní funkce
- [ ] **I1-1**: Implementace autentizačního flow ve frontendu
  - Poznámky:

- [ ] **I1-2**: Vytvoření základních API endpointů pro autentizaci
  - Poznámky:

- [ ] **I1-3**: Nastavení interceptorů pro API požadavky s JWT tokeny
  - Poznámky:

- [ ] **I1-4**: Implementace základního error handlingu
  - Poznámky:

- [ ] **I1-5**: Nastavení lokálního úložiště pro soubory
  - Poznámky:

- [ ] **I1-6**: Implementace drag & drop funkcionality pro nahrávání souborů
  - Poznámky:

### CI/CD a deployment
- [ ] **C1-1**: Nastavení GitHub Actions pro automatické testy
  - Poznámky:

- [ ] **C1-2**: Konfigurace workflow pro kontinualní integraci
  - Poznámky:

- [ ] **C1-3**: Nastavení automatického nasazení pro vývojové prostředí
  - Poznámky:

- [ ] **C1-4**: Vytvoření testovacích skriptů pro základní funkce
  - Poznámky:

---

## Fáze 2: Dashboard a správa klientů (2 týdny)

### Dashboard
- [ ] **F2-1**: Implementace komponent pro statistické karty
  - Poznámky:

- [ ] **F2-2**: Integrace Chart.js pro vizualizaci dat
  - Poznámky:

- [ ] **F2-3**: Vytvoření grafu pro zobrazení stavu projektů
  - Poznámky:

- [ ] **F2-4**: Implementace seznamu nedávných aktivit
  - Poznámky:

- [ ] **F2-5**: Vytvoření filtrů a řazení pro projekty
  - Poznámky:

- [ ] **F2-6**: Implementace vyhledávání projektů
  - Poznámky:

### Správa klientů
- [ ] **F2-7**: Vytvoření CRUD operací pro klienty v backendu
  - Poznámky:

- [ ] **F2-8**: Implementace seznamu klientů s vyhledáváním a filtrováním
  - Poznámky:

- [ ] **F2-9**: Vytvoření detailního zobrazení klienta
  - Poznámky:

- [ ] **F2-10**: Implementace formuláře pro vytvoření/editaci klienta
  - Poznámky:

- [ ] **F2-11**: Propojení klientů s projekty
  - Poznámky:

- [ ] **F2-12**: Vytvoření historie projektů pro klienta
  - Poznámky:

### Notifikace a uživatelská nastavení
- [ ] **F2-13**: Implementace notifikačního systému v backendu
  - Poznámky:

- [ ] **F2-14**: Vytvoření UI komponent pro zobrazení notifikací
  - Poznámky:

- [ ] **F2-15**: Implementace nastavení uživatelského profilu
  - Poznámky:

- [ ] **F2-16**: Vytvoření stránky pro správu notifikačních preferencí
  - Poznámky:

- [ ] **F2-17**: Implementace přepínání jazyka (i18n)
  - Poznámky:

- [ ] **F2-18**: Uložení uživatelských preferencí do databáze
  - Poznámky:

---

## Fáze 3: Zpracování dokumentů a analýza (3 týdny)

### Nahrávání a správa dokumentů
- [ ] **F3-1**: Implementace nahrávání dokumentů s drag & drop
  - Poznámky:

- [ ] **F3-2**: Vytvoření náhledu dokumentů
  - Poznámky:

- [ ] **F3-3**: Implementace extrakce textu z různých formátů dokumentů
  - Poznámky:

- [ ] **F3-4**: Vytvoření API pro správu dokumentů
  - Poznámky:

- [ ] **F3-5**: Implementace verzování dokumentů
  - Poznámky:

### Integrace Analyst agenta
- [ ] **A3-1**: Nastavení OpenAI API integrace
  - Poznámky:

- [ ] **A3-2**: Implementace služby pro komunikaci s LLM
  - Poznámky:

- [ ] **A3-3**: Vytvoření prompt šablon pro Analyst agenta
  - Poznámky:

- [ ] **A3-4**: Implementace zpracování odpovědí od LLM
  - Poznámky:

- [ ] **A3-5**: Vytvoření fronty pro asynchronní zpracování požadavků
  - Poznámky:

### Správa požadavků
- [ ] **F3-6**: Implementace UI pro zobrazení požadavků s barevným kódováním
  - Poznámky:

- [ ] **F3-7**: Vytvoření inline editace požadavků
  - Poznámky:

- [ ] **F3-8**: Implementace drag & drop pro řazení požadavků
  - Poznámky:

- [ ] **F3-9**: Vytvoření filtrů pro požadavky (typ, priorita, status)
  - Poznámky:

- [ ] **F3-10**: Implementace schvalování/odmítání AI navržených požadavků
  - Poznámky:

### Komentáře a spolupráce
- [ ] **F3-11**: Implementace komentářového systému v backendu
  - Poznámky:

- [ ] **F3-12**: Vytvoření UI komponent pro zobrazení a přidávání komentářů
  - Poznámky:

- [ ] **F3-13**: Implementace notifikací pro nové komentáře
  - Poznámky:

- [ ] **F3-14**: Vytvoření historie změn požadavků
  - Poznámky:

---

## Fáze 4: Návrh architektury (3 týdny)

### Integrace Architect agenta
- [ ] **A4-1**: Implementace služby pro komunikaci s Architect agentem
  - Poznámky:

- [ ] **A4-2**: Vytvoření prompt šablon pro generování architektury
  - Poznámky:

- [ ] **A4-3**: Implementace zpracování odpovědí od LLM
  - Poznámky:

- [ ] **A4-4**: Vytvoření vizualizace průběhu generování
  - Poznámky:

### Vizualizace architektury
- [ ] **F4-1**: Implementace interaktivního diagramu architektury
  - Poznámky:

- [ ] **F4-2**: Vytvoření editoru pro úpravu diagramu
  - Poznámky:

- [ ] **F4-3**: Implementace zobrazení závislostí mezi komponentami
  - Poznámky:

- [ ] **F4-4**: Vytvoření exportu diagramu do různých formátů
  - Poznámky:

### Správa komponent
- [ ] **F4-5**: Implementace CRUD operací pro komponenty
  - Poznámky:

- [ ] **F4-6**: Vytvoření UI s barevným kódováním složitosti
  - Poznámky:

- [ ] **F4-7**: Implementace inline editace komponent
  - Poznámky:

- [ ] **F4-8**: Vytvoření propojení komponent se závislostmi
  - Poznámky:

- [ ] **F4-9**: Implementace technického specifikačního editoru s rich textem
  - Poznámky:

---

## Fáze 5: Plánování projektu (2 týdny)

### Integrace Project Manager agenta
- [ ] **A5-1**: Implementace služby pro komunikaci s Project Manager agentem
  - Poznámky:

- [ ] **A5-2**: Vytvoření prompt šablon pro generování rozpočtu a časové osy
  - Poznámky:

- [ ] **A5-3**: Implementace zpracování odpovědí od LLM
  - Poznámky:

- [ ] **A5-4**: Vytvoření vizualizace průběhu generování
  - Poznámky:

### Správa rozpočtu
- [ ] **F5-1**: Implementace CRUD operací pro role a sazby
  - Poznámky:

- [ ] **F5-2**: Vytvoření UI pro správu rozpočtových položek
  - Poznámky:

- [ ] **F5-3**: Implementace automatického výpočtu nákladů
  - Poznámky:

- [ ] **F5-4**: Vytvoření souhrnných karet rozpočtu
  - Poznámky:

- [ ] **F5-5**: Implementace inline editace rozpočtových položek
  - Poznámky:

### Časová osa a milníky
- [ ] **F5-6**: Integrace Vue Gantt pro vizualizaci časové osy
  - Poznámky:

- [ ] **F5-7**: Implementace interaktivní úpravy časové osy
  - Poznámky:

- [ ] **F5-8**: Vytvoření správy milníků
  - Poznámky:

- [ ] **F5-9**: Implementace zobrazení závislostí mezi úkoly
  - Poznámky:

- [ ] **F5-10**: Vytvoření exportu časové osy
  - Poznámky:

---

## Fáze 6: Generování návrhů a šablony (3 týdny)

### Integrace Sales Representative agenta
- [ ] **A6-1**: Implementace služby pro komunikaci s Sales Representative agentem
  - Poznámky:

- [ ] **A6-2**: Vytvoření prompt šablon pro generování návrhů
  - Poznámky:

- [ ] **A6-3**: Implementace zpracování odpovědí od LLM
  - Poznámky:

- [ ] **A6-4**: Vytvoření vizualizace průběhu generování
  - Poznámky:

- [ ] **A6-5**: Implementace služby pro vylepšování návrhů
  - Poznámky:

### Náhled a editace návrhu
- [ ] **F6-1**: Implementace interaktivního náhledu návrhu
  - Poznámky:

- [ ] **F6-2**: Vytvoření přepínání mezi formáty (Web, PDF, DOCX)
  - Poznámky:

- [ ] **F6-3**: Implementace rich text editoru pro sekce návrhu
  - Poznámky:

- [ ] **F6-4**: Vytvoření navigace pomocí obsahu
  - Poznámky:

- [ ] **F6-5**: Implementace verzování návrhů
  - Poznámky:

### Export a sdílení
- [ ] **F6-6**: Implementace exportu do PDF s vlastním stylováním
  - Poznámky:

- [ ] **F6-7**: Vytvoření exportu do DOCX s vlastním stylováním
  - Poznámky:

- [ ] **F6-8**: Implementace odesílání návrhu e-mailem
  - Poznámky:

- [ ] **F6-9**: Vytvoření veřejného odkazu pro sdílení návrhu
  - Poznámky:

- [ ] **F6-10**: Implementace sledování otevření návrhu
  - Poznámky:

### Správa šablon
- [ ] **F6-11**: Implementace CRUD operací pro šablony
  - Poznámky:

- [ ] **F6-12**: Vytvoření galerie šablon s náhledy
  - Poznámky:

- [ ] **F6-13**: Implementace kategorizace šablon
  - Poznámky:

- [ ] **F6-14**: Vytvoření systému pro sdílení šablon
  - Poznámky:

- [ ] **F6-15**: Implementace aplikování šablony na nový projekt
  - Poznámky:

---

## Fáze 7: Mobilní optimalizace a pokročilé funkce (2 týdny)

### Mobilní optimalizace
- [ ] **F7-1**: Optimalizace všech obrazovek pro mobilní zařízení
  - Poznámky:

- [ ] **F7-2**: Implementace bottom navigation pro mobilní zobrazení
  - Poznámky:

- [ ] **F7-3**: Vytvoření responzivních tabulek a seznamů
  - Poznámky:

- [ ] **F7-4**: Optimalizace formulářů pro dotykové ovládání
  - Poznámky:

- [ ] **F7-5**: Testování na různých mobilních zařízeních
  - Poznámky:

### Pokročilé interakce
- [ ] **F7-6**: Implementace swipe gest pro navigaci
  - Poznámky:

- [ ] **F7-7**: Vytvoření klávesových zkratek pro běžné akce
  - Poznámky:

- [ ] **F7-8**: Implementace drag & drop pro řazení a přesouvání
  - Poznámky:

- [ ] **F7-9**: Vytvoření kontextových menu
  - Poznámky:

- [ ] **F7-10**: Implementace pokročilého vyhledávání a filtrování
  - Poznámky:

### Offline funkce a výkon
- [ ] **F7-11**: Implementace ukládání rozpracovaných změn
  - Poznámky:

- [ ] **F7-12**: Vytvoření offline režimu pro základní funkce
  - Poznámky:

- [ ] **F7-13**: Optimalizace načítání velkých seznamů (virtuální scrolling)
  - Poznámky:

- [ ] **F7-14**: Implementace lazy loading pro obrázky a komponenty
  - Poznámky:

- [ ] **F7-15**: Optimalizace výkonu aplikace
  - Poznámky:

---

## Fáze 8: Integrace a testování (2 týdny)

### Unit testy
- [ ] **T8-1**: Vytvoření unit testů pro frontend komponenty
  - Poznámky:

- [ ] **T8-2**: Implementace unit testů pro backend služby
  - Poznámky:

- [ ] **T8-3**: Vytvoření testů pro validaci dat
  - Poznámky:

- [ ] **T8-4**: Implementace testů pro autentizaci a autorizaci
  - Poznámky:

- [ ] **T8-5**: Vytvoření mock služeb pro testování
  - Poznámky:

### Integrační testy
- [ ] **T8-6**: Implementace end-to-end testů s Cypress
  - Poznámky:

- [ ] **T8-7**: Vytvoření testů pro klíčové uživatelské scénáře
  - Poznámky:

- [ ] **T8-8**: Implementace testů pro API endpointy
  - Poznámky:

- [ ] **T8-9**: Vytvoření testů pro integraci s OpenAI API
  - Poznámky:

- [ ] **T8-10**: Implementace testů pro databázové operace
  - Poznámky:

### Výkonnostní testování
- [ ] **T8-11**: Provedení zátěžových testů API
  - Poznámky:

- [ ] **T8-12**: Optimalizace výkonu databázových dotazů
  - Poznámky:

- [ ] **T8-13**: Implementace cachování pro často používaná data
  - Poznámky:

- [ ] **T8-14**: Vytvoření monitoringu výkonu
  - Poznámky:

- [ ] **T8-15**: Optimalizace velikosti bundle pro frontend
  - Poznámky:

### Bezpečnostní testování
- [ ] **T8-16**: Provedení bezpečnostního auditu
  - Poznámky:

- [ ] **T8-17**: Testování autentizace a autorizace
  - Poznámky:

- [ ] **T8-18**: Implementace ochrany proti CSRF, XSS a SQL injection
  - Poznámky:

- [ ] **T8-19**: Vytvoření rate limitingu pro API
  - Poznámky:

- [ ] **T8-20**: Testování zabezpečení souborů
  - Poznámky:

---

## Fáze 9: Nasazení a dokumentace (1 týden)

### Produkční nasazení
- [ ] **D9-1**: Finalizace Docker kontejnerů
  - Poznámky:

- [ ] **D9-2**: Nastavení produkčního prostředí
  - Poznámky:

- [ ] **D9-3**: Konfigurace SSL certifikátů
  - Poznámky:

- [ ] **D9-4**: Implementace monitoringu a logování
  - Poznámky:

- [ ] **D9-5**: Vytvoření zálohovacího systému
  - Poznámky:

### Uživatelská dokumentace
- [ ] **D9-6**: Vytvoření uživatelské příručky s screenshoty
  - Poznámky:

- [ ] **D9-7**: Implementace kontextové nápovědy v aplikaci
  - Poznámky:

- [ ] **D9-8**: Vytvoření video tutoriálů pro klíčové funkce
  - Poznámky:

- [ ] **D9-9**: Implementace onboarding průvodce pro nové uživatele
  - Poznámky:

- [ ] **D9-10**: Vytvoření FAQ sekce
  - Poznámky:

### Administrátorská dokumentace
- [ ] **D9-11**: Vytvoření instalační příručky
  - Poznámky:

- [ ] **D9-12**: Implementace dokumentace API
  - Poznámky:

- [ ] **D9-13**: Vytvoření příručky pro správu uživatelů
  - Poznámky:

- [ ] **D9-14**: Implementace dokumentace databázového schématu
  - Poznámky:

- [ ] **D9-15**: Vytvoření příručky pro řešení problémů
  - Poznámky:

### Školení a podpora
- [ ] **D9-16**: Příprava školících materiálů
  - Poznámky:

- [ ] **D9-17**: Vytvoření systému pro zpětnou vazbu
  - Poznámky:

- [ ] **D9-18**: Implementace podpory v aplikaci
  - Poznámky:

- [ ] **D9-19**: Vytvoření znalostní báze
  - Poznámky:

- [ ] **D9-20**: Příprava plánu pro budoucí aktualizace
  - Poznámky:

---

## Instrukce pro AI agenta

1. Při zahájení práce na úloze změňte stav z `[ ]` na `[⚙️]` (Started).
2. Po dokončení úlohy změňte stav z `[⚙️]` na `[✅]` (Completed).
3. Do sekce "Poznámky" zapište informace o provedených úpravách, rozšířeních a případných problémech, které jste řešili.
4. Udržujte tento soubor aktuální, aby sloužil jako přehled o postupu implementace.
5. Pokud zjistíte, že je potřeba přidat novou úlohu, přidejte ji do příslušné sekce s novým ID.
6. Pokud zjistíte, že některá úloha není potřeba, označte ji jako `[❌]` (Not Applicable) a vysvětlete důvod v poznámkách.

---

## Statistika postupu

- Celkový počet úloh: 10/160 (6.25%)
- Fáze 0: 10/10 (100%)
- Fáze 1: 0/25 (0%)
- Fáze 2: 0/18 (0%)
- Fáze 3: 0/14 (0%)
- Fáze 4: 0/9 (0%)
- Fáze 5: 0/10 (0%)
- Fáze 6: 0/15 (0%)
- Fáze 7: 0/15 (0%)
- Fáze 8: 0/20 (0%)
- Fáze 9: 0/20 (0%)
