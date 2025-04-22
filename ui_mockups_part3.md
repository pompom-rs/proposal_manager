# Proposal Manager UI Mockups - Part 3

## Project Creation (Vylepšená)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ Proposal Manager                      🔔 Notifications  User ▼  Logout  │
├─────────────┬───────────────────────────────────────────────────────────┤
│             │ Home > Projects > Create New Project                      │
│  📊 Dashboard│                                                           │
│             │ Create New Project                                        │
│  📁 Projects │                                                           │
│             │ ┌───────────────────────────────────────────────────────┐ │
│  📑 Templates│ │ 1. Basic Info  │ 2. Requirements │ 3. Team │ 4. Review│ │
│             │ └───────────────────────────────────────────────────────┘ │
│  👥 Clients  │                                                           │
│             │ Project Name:                                             │
│  📈 Reports  │ ┌─────────────────────────────────────────────────────┐   │
│             │ │                                                     │   │
│  ⚙️ Settings │ └─────────────────────────────────────────────────────┘   │
│             │                                                           │
│             │ Client:                                                   │
│  🌙 Dark Mode│ ┌─────────────────────────────────────────────────────┐   │
│             │ │ Select client...                                ▼   │   │
│             │ └─────────────────────────────────────────────────────┘   │
│             │                                                           │
│             │ Description:                                              │
│             │ ┌─────────────────────────────────────────────────────┐   │
│             │ │                                                     │   │
│             │ │                                                     │   │
│             │ └─────────────────────────────────────────────────────┘   │
│             │                                                           │
│             │ Upload Requirements Document:                             │
│             │ ┌─────────────────────────────────────────────────────┐   │
│             │ │ 📄 Choose File or Drag & Drop                       │   │
│             │ └─────────────────────────────────────────────────────┘   │
│             │                                                           │
│             │ Start from Template:                                      │
│             │ ┌─────────────────────────────────────────────────────┐   │
│             │ │ Select template...                              ▼   │   │
│             │ └─────────────────────────────────────────────────────┘   │
│             │                                                           │
│             │ ┌─────────┐  ┌──────────────┐                             │
│             │ │ Cancel  │  │ Next: Requirements ▶                      │
│             │ └─────────┘  └──────────────┘                             │
└─────────────┴───────────────────────────────────────────────────────────┘
```

**Vylepšení:**
- Přidán průvodce (wizard) s kroky pro vytvoření projektu
- Přidána možnost výběru klienta z rozbalovacího seznamu
- Přidána možnost výběru šablony pro rychlejší start
- Vylepšené nahrávání souborů s podporou drag & drop
- Přidána drobečková navigace
- Přehlednější rozložení formuláře
- Tlačítko "Next" jasně ukazuje následující krok

### Mobilní zobrazení - Project Creation

```
┌───────────────────────┐
│ Proposal Manager    ☰ │
│                       │
│ Create New Project    │
│                       │
│ ┌─────────────────┐   │
│ │ 1. Basic Info   │   │
│ │ 2. Requirements │   │
│ │ 3. Team         │   │
│ │ 4. Review       │   │
│ └─────────────────┘   │
│                       │
│ Project Name:         │
│ ┌─────────────────┐   │
│ │                 │   │
│ └─────────────────┘   │
│                       │
│ Client:               │
│ ┌─────────────────┐   │
│ │ Select client ▼ │   │
│ └─────────────────┘   │
│                       │
│ Description:          │
│ ┌─────────────────┐   │
│ │                 │   │
│ │                 │   │
│ └─────────────────┘   │
│                       │
│ Upload Document:      │
│ ┌─────────────────┐   │
│ │ 📄 Choose File  │   │
│ └─────────────────┘   │
│                       │
│ Template:             │
│ ┌─────────────────┐   │
│ │ Select template▼│   │
│ └─────────────────┘   │
│                       │
│ ┌─────────┐┌────────┐ │
│ │ Cancel  ││  Next ▶│ │
│ └─────────┘└────────┘ │
│                       │
│ 📊 📁 📑 👥 ⚙️         │
└───────────────────────┘
```

**Vylepšení pro mobilní zobrazení:**
- Zjednodušený průvodce s kroky
- Optimalizované formulářové prvky pro dotykové ovládání
- Přizpůsobená velikost tlačítek pro snadné kliknutí
- Navigace ve spodní části obrazovky
