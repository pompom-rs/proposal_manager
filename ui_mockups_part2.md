# Proposal Manager UI Mockups - Part 2

## Dashboard (Vylepšený)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ Proposal Manager                      🔔 Notifications  User ▼  Logout  │
├─────────────┬───────────────────────────────────────────────────────────┤
│             │ Dashboard                                                 │
│  📊 Dashboard│                                                           │
│             │ ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐          │
│  📁 Projects │ │ Active  │ │ Draft   │ │ Completed│ │ Total   │          │
│             │ │ Projects│ │ Proposals│ │ Proposals│ │ Budget  │          │
│  📑 Templates│ │   12    │ │    5    │ │    8     │ │ $125,400│          │
│             │ └─────────┘ └─────────┘ └─────────┘ └─────────┘          │
│  👥 Clients  │                                                           │
│             │ Project Status                      Recent Activity       │
│  📈 Reports  │ ┌───────────────────────┐          ┌───────────────────┐ │
│             │ │                       │          │ • Project "Client  │ │
│  ⚙️ Settings │ │  [PIE CHART:         │          │   X Website" moved │ │
│             │ │   Projects by Status] │          │   to Architecture  │ │
│             │ │                       │          │ • New requirement  │ │
│  🌙 Dark Mode│ │  ⬤ Draft (5)         │          │   added to "Mobile │ │
│             │ │  ⬤ Analysis (3)       │          │   App Project"     │ │
│             │ │  ⬤ Architecture (2)   │          │ • Proposal for     │ │
│             │ │  ⬤ Planning (1)       │          │   "E-commerce      │ │
│             │ │  ⬤ Sales (1)          │          │   Platform" was    │ │
│             │ │  ⬤ Completed (8)      │          │   exported         │ │
│             │ └───────────────────────┘          └───────────────────┘ │
│             │                                                           │
│             │ Projects (Recent)                            View All >   │
│             │ ┌─────────┬─────────────┬──────────┬──────────┬─────────┐ │
│             │ │ Name    │ Description │ Status   │ Created  │ Actions │ │
│             │ ├─────────┼─────────────┼──────────┼──────────┼─────────┤ │
│             │ │ Proj 1  │ Client A... │ 🔵 Analysis│ 2023-... │ ⋮       │ │
│             │ ├─────────┼─────────────┼──────────┼──────────┼─────────┤ │
│             │ │ Proj 2  │ Client B... │ 🟤 Draft   │ 2023-... │ ⋮       │ │
│             │ └─────────┴─────────────┴──────────┴──────────┴─────────┘ │
└─────────────┴───────────────────────────────────────────────────────────┘
```

**Vylepšení:**
- Přidány statistické karty s klíčovými metrikami
- Přidán graf zobrazující stav projektů
- Přidán seznam nedávných aktivit
- Barevné kódování stavů projektů
- Přehlednější uspořádání informací do sekcí
- Tlačítko "View All" pro přechod na úplný seznam projektů

### Mobilní zobrazení - Dashboard

```
┌───────────────────────┐
│ Proposal Manager    ☰ │
│                       │
│ Dashboard             │
│                       │
│ ┌─────────────────┐   │
│ │ Active Projects │   │
│ │       12        │   │
│ └─────────────────┘   │
│                       │
│ ┌─────────────────┐   │
│ │ Draft Proposals │   │
│ │        5        │   │
│ └─────────────────┘   │
│                       │
│ Project Status        │
│ ┌─────────────────┐   │
│ │ [PIE CHART]     │   │
│ └─────────────────┘   │
│                       │
│ Recent Activity       │
│ ┌─────────────────┐   │
│ │ • Project "X"   │   │
│ │   moved to      │   │
│ │   Architecture  │   │
│ │ • New require...│   │
│ └─────────────────┘   │
│                       │
│ Projects (Recent)     │
│ ┌─────────────────┐   │
│ │ Proj 1          │   │
│ │ 🔵 Analysis      │   │
│ └─────────────────┘   │
│ ┌─────────────────┐   │
│ │ Proj 2          │   │
│ │ 🟤 Draft         │   │
│ └─────────────────┘   │
│                       │
│ 📊 📁 📑 👥 ⚙️         │
└───────────────────────┘
```

**Vylepšení pro mobilní zobrazení:**
- Karty zobrazeny vertikálně pro lepší čitelnost
- Zjednodušený graf stavu projektů
- Kompaktní zobrazení projektů jako karty místo tabulky
- Navigace ve spodní části obrazovky (bottom navigation)
- Hamburger menu pro přístup k dalším možnostem
