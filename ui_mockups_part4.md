# Proposal Manager UI Mockups - Part 4

## Requirements Management (Vylepšená)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ Proposal Manager                      🔔 Notifications  User ▼  Logout  │
├─────────────┬───────────────────────────────────────────────────────────┤
│             │ Home > Projects > Client A Website > Requirements         │
│  📊 Dashboard│                                                           │
│             │ Project: Client A Website Redesign                        │
│  📁 Projects │ ┌─────────┬─────────┬─────────┬─────────┬─────────┐       │
│             │ │ Details │ Require.│ Archit. │ Budget  │ Proposal│       │
│  📑 Templates│ └─────────┴─────────┴─────────┴─────────┴─────────┘       │
│             │                                                           │
│  👥 Clients  │ Requirements                                + Add New     │
│             │                                                           │
│  📈 Reports  │ AI Analysis: ┌──────────┐ ┌───────────┐ ┌───────────────┐│
│             │              │▶️ Analyze │ │ 🔄 Refresh │ │ 📥 Import     ││
│  ⚙️ Settings │              └──────────┘ └───────────┘ └───────────────┘│
│             │                                                           │
│             │ ┌────┬─────────────────┬──────────┬─────────┬──────────┬─┐│
│  🌙 Dark Mode│ │ ID │ Description     │ Type     │ Priority│ Status   │⋮││
│             │ ├────┼─────────────────┼──────────┼─────────┼──────────┼─┤│
│             │ │ 1  │ User login with │ 🔧 Funct. │ 🔴 High  │ ✅ Approved│⋮││
│             │ │    │ OAuth           │          │         │          │ ││
│             │ ├────┼─────────────────┼──────────┼─────────┼──────────┼─┤│
│             │ │ 2  │ Responsive UI   │ 🔩 Non-f. │ 🟡 Medium│ ⏳ Proposed│⋮││
│             │ ├────┼─────────────────┼──────────┼─────────┼──────────┼─┤│
│             │ │ 3  │ User profile    │ 🔧 Funct. │ 🟢 Low   │ ✅ Approved│⋮││
│             │ │    │ management      │          │         │          │ ││
│             │ └────┴─────────────────┴──────────┴─────────┴──────────┴─┘│
│             │                                                           │
│             │ 💬 Comments (3)                                  + Add    │
│             │ ┌─────────────────────────────────────────────────────┐   │
│             │ │ John (2 hours ago): We should prioritize mobile     │   │
│             │ │ responsiveness for all UI components.               │   │
│             │ ├─────────────────────────────────────────────────────┤   │
│             │ │ Sarah (yesterday): Agreed, our analytics show 60%   │   │
│             │ │ of users access the site from mobile devices.       │   │
│             │ └─────────────────────────────────────────────────────┘   │
│             │                                                           │
│             │ ┌──────────────────┐  ┌──────────────────────────┐        │
│             │ │ Save Changes     │  │ Proceed to Architecture ▶│        │
│             │ └──────────────────┘  └──────────────────────────┘        │
└─────────────┴───────────────────────────────────────────────────────────┘
```

**Vylepšení:**
- Přidány ikony pro typy požadavků (funkční/nefunkční)
- Barevné kódování priorit (vysoká/střední/nízká)
- Vizuální indikátory stavu (schváleno/navrženo)
- Přidána sekce komentářů pro diskuzi o požadavcích
- Přidány tlačítka pro AI analýzu, obnovení a import
- Možnost řazení a filtrování (naznačeno tlačítkem ⋮)
- Přehlednější rozložení s více informacemi
- Drobečková navigace pro lepší orientaci

### Mobilní zobrazení - Requirements Management

```
┌───────────────────────┐
│ Proposal Manager    ☰ │
│                       │
│ Client A Website      │
│ Requirements          │
│                       │
│ ┌─────────────────┐   │
│ │Details│Req│Arc│...│ │
│ └─────────────────┘   │
│                       │
│ AI Analysis:          │
│ ┌─────┐┌─────┐┌─────┐ │
│ │▶️ Run││🔄 Ref││📥 Imp│ │
│ └─────┘└─────┘└─────┘ │
│                       │
│ Requirements     + Add│
│ ┌─────────────────┐   │
│ │ 1. User login   │   │
│ │ 🔧 Funct. 🔴 High│   │
│ │ ✅ Approved      │   │
│ └─────────────────┘   │
│ ┌─────────────────┐   │
│ │ 2. Responsive UI│   │
│ │ 🔩 Non-f. 🟡 Med.│   │
│ │ ⏳ Proposed      │   │
│ └─────────────────┘   │
│                       │
│ 💬 Comments (3)   +Add│
│ ┌─────────────────┐   │
│ │ John: We should │   │
│ │ prioritize...   │   │
│ └─────────────────┘   │
│                       │
│ ┌─────┐┌───────────┐  │
│ │ Save││ Next: Arc ▶│ │
│ └─────┘└───────────┘  │
│                       │
│ 📊 📁 📑 👥 ⚙️         │
└───────────────────────┘
```

**Vylepšení pro mobilní zobrazení:**
- Karty místo tabulky pro lepší čitelnost na malé obrazovce
- Zkrácené záložky pro úsporu místa
- Kompaktní zobrazení tlačítek AI analýzy
- Swipe gesta pro přechod mezi požadavky (není viditelné v ASCII)
- Optimalizované zobrazení komentářů
