# Proposal Manager UI Mockups - Part 5

## Architecture View (Vylepšená)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ Proposal Manager                      🔔 Notifications  User ▼  Logout  │
├─────────────┬───────────────────────────────────────────────────────────┤
│             │ Home > Projects > Client A Website > Architecture         │
│  📊 Dashboard│                                                           │
│             │ Project: Client A Website Redesign                        │
│  📁 Projects │ ┌─────────┬─────────┬─────────┬─────────┬─────────┐       │
│             │ │ Details │ Require.│ Archit. │ Budget  │ Proposal│       │
│  📑 Templates│ └─────────┴─────────┴─────────┴─────────┴─────────┘       │
│             │                                                           │
│  👥 Clients  │ Architecture Overview                                     │
│             │ ┌─────────────────────────────────────────────────────┐   │
│  📈 Reports  │ │ The system will use a microservices architecture... │   │
│             │ └─────────────────────────────────────────────────────┘   │
│  ⚙️ Settings │                                                           │
│             │ AI Design: ┌──────────┐ ┌───────────┐ ┌───────────────┐   │
│             │           │▶️ Generate│ │ 🔄 Refresh │ │ 📥 Import     │   │
│  🌙 Dark Mode│           └──────────┘ └───────────┘ └───────────────┘   │
│             │                                                           │
│             │ System Diagram                                            │
│             │ ┌─────────────────────────────────────────────────────┐   │
│             │ │                                                     │   │
│             │ │  ┌──────────┐        ┌───────────┐                  │   │
│             │ │  │ Frontend │───────▶│ API Layer │                  │   │
│             │ │  └──────────┘        └───────────┘                  │   │
│             │ │       ▲                    │                        │   │
│             │ │       │                    ▼                        │   │
│             │ │       │              ┌───────────┐                  │   │
│             │ │       └──────────────│ Database  │                  │   │
│             │ │                      └───────────┘                  │   │
│             │ │                                                     │   │
│             │ └─────────────────────────────────────────────────────┘   │
│             │                                                           │
│             │ Components                                    + Add       │
│             │ ┌──────────┬───────────────┬──────────┬────────────┬────┐ │
│             │ │ Name     │ Description   │ Tech     │ Complexity │ ⋮  │ │
│             │ ├──────────┼───────────────┼──────────┼────────────┼────┤ │
│             │ │ Frontend │ User interface│ Vue.js   │ 🟡 Medium   │ ⋮  │ │
│             │ ├──────────┼───────────────┼──────────┼────────────┼────┤ │
│             │ │ API      │ Backend API   │ FastAPI  │ 🔴 High     │ ⋮  │ │
│             │ ├──────────┼───────────────┼──────────┼────────────┼────┤ │
│             │ │ Database │ Data storage  │ Supabase │ 🟢 Low      │ ⋮  │ │
│             │ └──────────┴───────────────┴──────────┴────────────┴────┘ │
│             │                                                           │
│             │ ┌──────────────────┐  ┌──────────────────────┐            │
│             │ │ Save Changes     │  │ Proceed to Budget  ▶ │            │
│             │ └──────────────────┘  └──────────────────────┘            │
└─────────────┴───────────────────────────────────────────────────────────┘
```

**Vylepšení:**
- Přidán interaktivní diagram systémové architektury
- Barevné kódování složitosti komponent
- Přidány tlačítka pro AI generování, obnovení a import
- Možnost řazení a filtrování komponent (naznačeno tlačítkem ⋮)
- Přidána možnost přidávat nové komponenty
- Drobečková navigace pro lepší orientaci
- Přehlednější rozložení s více informacemi

### Mobilní zobrazení - Architecture View

```
┌───────────────────────┐
│ Proposal Manager    ☰ │
│                       │
│ Client A Website      │
│ Architecture          │
│                       │
│ ┌─────────────────┐   │
│ │Det│Req│Arc│Bud│Pro│ │
│ └─────────────────┘   │
│                       │
│ Architecture Overview │
│ ┌─────────────────┐   │
│ │ The system will │   │
│ │ use a microser..│   │
│ └─────────────────┘   │
│                       │
│ AI Design:            │
│ ┌─────┐┌─────┐┌─────┐ │
│ │▶️ Gen││🔄 Ref││📥 Imp│ │
│ └─────┘└─────┘└─────┘ │
│                       │
│ System Diagram        │
│ ┌─────────────────┐   │
│ │ [Simplified     │   │
│ │  diagram with   │   │
│ │  key components]│   │
│ └─────────────────┘   │
│                       │
│ Components      + Add │
│ ┌─────────────────┐   │
│ │ Frontend        │   │
│ │ Vue.js 🟡 Medium │   │
│ └─────────────────┘   │
│ ┌─────────────────┐   │
│ │ API             │   │
│ │ FastAPI 🔴 High  │   │
│ └─────────────────┘   │
│                       │
│ ┌─────┐┌───────────┐  │
│ │ Save││ Next: Bud ▶│ │
│ └─────┘└───────────┘  │
│                       │
│ 📊 📁 📑 👥 ⚙️         │
└───────────────────────┘
```

**Vylepšení pro mobilní zobrazení:**
- Zjednodušený diagram architektury optimalizovaný pro malou obrazovku
- Komponenty zobrazeny jako karty místo tabulky
- Zkrácené záložky pro úsporu místa
- Kompaktní zobrazení tlačítek AI designu
- Swipe gesta pro přechod mezi komponentami (není viditelné v ASCII)
