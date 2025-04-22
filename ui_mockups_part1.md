# Proposal Manager UI Mockups - Part 1

## Navigation Structure (Vylepšená)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ Proposal Manager                      🔔 Notifications  User ▼  Logout  │
├─────────────┬───────────────────────────────────────────────────────────┤
│             │ Home > Projects > Project Name                            │
│  📊 Dashboard│                                                           │
│             │                                                           │
│  📁 Projects │                                                           │
│             │                                                           │
│  📑 Templates│                  Content Area                             │
│             │                                                           │
│  👥 Clients  │                                                           │
│             │                                                           │
│  📈 Reports  │                                                           │
│             │                                                           │
│  ⚙️ Settings │                                                           │
│             │                                                           │
│             │                                                           │
│  🌙 Dark Mode│                                                           │
│             │                                                           │
└─────────────┴───────────────────────────────────────────────────────────┘
```

**Vylepšení:**
- Přidány ikony k položkám menu pro rychlejší vizuální rozpoznání
- Přidána drobečková navigace (breadcrumbs) pro lepší orientaci
- Přidáno tlačítko notifikací v horní liště
- Rozšířeno menu o další užitečné sekce (Templates, Clients, Reports)
- Přidáno přepínání tmavého režimu ve spodní části menu

## Login Screen (Vylepšená)

```
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│                                                                         │
│                         ┌───────────────────┐                           │
│                         │  Proposal Manager │                           │
│                         └───────────────────┘                           │
│                                                                         │
│                         ┌───────────────────────────────┐               │
│                         │ 👤 Username                   │               │
│                         └───────────────────────────────┘               │
│                                                                         │
│                         ┌───────────────────────────────┐               │
│                         │ 🔒 Password                   │               │
│                         └───────────────────────────────┘               │
│                                                                         │
│                         ☐ Remember me                                   │
│                                                                         │
│                         ┌───────────────────────────────┐               │
│                         │           Login               │               │
│                         └───────────────────────────────┘               │
│                                                                         │
│                         ┌───────────────────────────────┐               │
│                         │ 🔑 Login with Google          │               │
│                         └───────────────────────────────┘               │
│                                                                         │
│                         Register | Forgot Password                      │
│                                                                         │
│                         🌙 Dark Mode                                    │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

**Vylepšení:**
- Přidány ikony pro uživatelské jméno a heslo
- Přidána možnost "Remember me"
- Přidána možnost přihlášení přes Google (OAuth)
- Přidáno přepínání tmavého režimu
- Vylepšený vizuální design s většími vstupními poli

### Mobilní zobrazení - Login Screen

```
┌───────────────────────┐
│                       │
│  Proposal Manager     │
│                       │
│ ┌───────────────────┐ │
│ │ 👤 Username       │ │
│ └───────────────────┘ │
│                       │
│ ┌───────────────────┐ │
│ │ 🔒 Password       │ │
│ └───────────────────┘ │
│                       │
│ ☐ Remember me         │
│                       │
│ ┌───────────────────┐ │
│ │      Login        │ │
│ └───────────────────┘ │
│                       │
│ ┌───────────────────┐ │
│ │ 🔑 Login with     │ │
│ │     Google        │ │
│ └───────────────────┘ │
│                       │
│ Register              │
│ Forgot Password       │
│                       │
│ 🌙 Dark Mode          │
│                       │
└───────────────────────┘
```

**Vylepšení pro mobilní zobrazení:**
- Optimalizovaný layout pro menší obrazovky
- Větší dotyková plocha pro tlačítka
- Vertikální uspořádání odkazů pro snadnější kliknutí
