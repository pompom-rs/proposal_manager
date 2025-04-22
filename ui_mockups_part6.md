# Proposal Manager UI Mockups - Part 6

## Budget Planning (Vylepšená)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ Proposal Manager                      🔔 Notifications  User ▼  Logout  │
├─────────────┬───────────────────────────────────────────────────────────┤
│             │ Home > Projects > Client A Website > Budget               │
│  📊 Dashboard│                                                           │
│             │ Project: Client A Website Redesign                        │
│  📁 Projects │ ┌─────────┬─────────┬─────────┬─────────┬─────────┐       │
│             │ │ Details │ Require.│ Archit. │ Budget  │ Proposal│       │
│  📑 Templates│ └─────────┴─────────┴─────────┴─────────┴─────────┘       │
│             │                                                           │
│  👥 Clients  │ Budget Summary                                           │
│             │ ┌─────────────────┐ ┌─────────────────┐ ┌─────────────┐   │
│  📈 Reports  │ │ Total Cost     │ │ Start Date      │ │ End Date    │   │
│             │ │ $15,750         │ │ 2023-10-01      │ │ 2023-12-15  │   │
│  ⚙️ Settings │ └─────────────────┘ └─────────────────┘ └─────────────┘   │
│             │                                                           │
│             │ AI Planning: ┌──────────┐ ┌───────────┐ ┌───────────────┐ │
│  🌙 Dark Mode│             │▶️ Generate│ │ 🔄 Refresh │ │ 📥 Import     │ │
│             │             └──────────┘ └───────────┘ └───────────────┘ │
│             │                                                           │
│             │ Roles                                         + Add Role  │
│             │ ┌──────────────┬───────────┬─────────┬────────────────┐   │
│             │ │ Role         │ Rate/Day  │ Currency│ Actions        │   │
│             │ ├──────────────┼───────────┼─────────┼────────────────┤   │
│             │ │ Developer    │ 500       │ USD     │ ✏️ Edit 🗑️ Delete│   │
│             │ ├──────────────┼───────────┼─────────┼────────────────┤   │
│             │ │ Designer     │ 450       │ USD     │ ✏️ Edit 🗑️ Delete│   │
│             │ └──────────────┴───────────┴─────────┴────────────────┘   │
│             │                                                           │
│             │ Budget Items                                  + Add Item  │
│             │ ┌──────────┬──────────┬──────┬──────────┬────────────┐    │
│             │ │ Component│ Role     │ Days │ Cost     │ Actions    │    │
│             │ ├──────────┼──────────┼──────┼──────────┼────────────┤    │
│             │ │ Frontend │ Developer│ 10   │ $5,000   │ ✏️ Edit 🗑️ Del│    │
│             │ ├──────────┼──────────┼──────┼──────────┼────────────┤    │
│             │ │ Frontend │ Designer │ 5    │ $2,250   │ ✏️ Edit 🗑️ Del│    │
│             │ ├──────────┼──────────┼──────┼──────────┼────────────┤    │
│             │ │ API      │ Developer│ 15   │ $7,500   │ ✏️ Edit 🗑️ Del│    │
│             │ └──────────┴──────────┴──────┴──────────┴────────────┘    │
│             │                                                           │
│             │ Timeline                                                  │
│             │ ┌─────────────────────────────────────────────────────┐   │
│             │ │ Oct 2023          Nov 2023          Dec 2023        │   │
│             │ │ ├─────────────────┼─────────────────┼───────────────┤   │
│             │ │ │                                                    │   │
│             │ │ │ Frontend ████████████                              │   │
│             │ │ │                                                    │   │
│             │ │ │ API      ████████████████████████                  │   │
│             │ │ │                                                    │   │
│             │ │ │ ◆ Design Complete    ◆ API Complete   ◆ Launch    │   │
│             │ └─────────────────────────────────────────────────────┘   │
│             │                                                           │
│             │ ┌──────────────────┐  ┌──────────────────────┐            │
│             │ │ Save Changes     │  │ Proceed to Proposal ▶│            │
│             │ └──────────────────┘  └──────────────────────┘            │
└─────────────┴───────────────────────────────────────────────────────────┘
```

**Vylepšení:**
- Přidáno přehledné shrnutí rozpočtu s celkovými náklady a daty
- Přidány tlačítka pro AI plánování, obnovení a import
- Přidány ikony pro akce (upravit, smazat)
- Přidán Ganttův diagram pro vizualizaci časové osy
- Zobrazení milníků na časové ose
- Drobečková navigace pro lepší orientaci
- Přehlednější rozložení s více informacemi

### Mobilní zobrazení - Budget Planning

```
┌───────────────────────┐
│ Proposal Manager    ☰ │
│                       │
│ Client A Website      │
│ Budget                │
│                       │
│ ┌─────────────────┐   │
│ │Det│Req│Arc│Bud│Pro│ │
│ └─────────────────┘   │
│                       │
│ Budget Summary        │
│ ┌─────────────────┐   │
│ │ Total: $15,750  │   │
│ │ 2023-10-01 to   │   │
│ │ 2023-12-15      │   │
│ └─────────────────┘   │
│                       │
│ AI Planning:          │
│ ┌─────┐┌─────┐┌─────┐ │
│ │▶️ Gen││🔄 Ref││📥 Imp│ │
│ └─────┘└─────┘└─────┘ │
│                       │
│ Roles           + Add │
│ ┌─────────────────┐   │
│ │ Developer       │   │
│ │ $500/day        │   │
│ └─────────────────┘   │
│ ┌─────────────────┐   │
│ │ Designer        │   │
│ │ $450/day        │   │
│ └─────────────────┘   │
│                       │
│ Budget Items    + Add │
│ ┌─────────────────┐   │
│ │ Frontend        │   │
│ │ Developer: 10d  │   │
│ │ $5,000          │   │
│ └─────────────────┘   │
│                       │
│ Timeline              │
│ ┌─────────────────┐   │
│ │ [Simplified     │   │
│ │  Gantt chart]   │   │
│ └─────────────────┘   │
│                       │
│ ┌─────┐┌───────────┐  │
│ │ Save││ Next: Pro ▶│ │
│ └─────┘└───────────┘  │
│                       │
│ 📊 📁 📑 👥 ⚙️         │
└───────────────────────┘
```

**Vylepšení pro mobilní zobrazení:**
- Kompaktní zobrazení shrnutí rozpočtu
- Karty místo tabulek pro role a položky rozpočtu
- Zjednodušený Ganttův diagram optimalizovaný pro malou obrazovku
- Zkrácené záložky pro úsporu místa
- Swipe gesta pro přechod mezi sekcemi (není viditelné v ASCII)
