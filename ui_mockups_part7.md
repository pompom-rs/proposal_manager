# Proposal Manager UI Mockups - Part 7

## Proposal Preview (Vylepšená)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ Proposal Manager                      🔔 Notifications  User ▼  Logout  │
├─────────────┬───────────────────────────────────────────────────────────┤
│             │ Home > Projects > Client A Website > Proposal             │
│  📊 Dashboard│                                                           │
│             │ Project: Client A Website Redesign                        │
│  📁 Projects │ ┌─────────┬─────────┬─────────┬─────────┬─────────┐       │
│             │ │ Details │ Require.│ Archit. │ Budget  │ Proposal│       │
│  📑 Templates│ └─────────┴─────────┴─────────┴─────────┴─────────┘       │
│             │                                                           │
│  👥 Clients  │ Proposal Preview                                          │
│             │ ┌─────────────────────────────────────────────────────┐   │
│  📈 Reports  │ │ ┌─────────┐ ┌─────────┐ ┌─────────┐                │   │
│             │ │ │ Web View │ │ PDF View│ │DOCX View│                │   │
│  ⚙️ Settings │ │ └─────────┘ └─────────┘ └─────────┘                │   │
│             │ │                                                     │   │
│             │ │ ┌─────────────────────────────────────────────────┐│   │
│  🌙 Dark Mode│ │ │                                                 ││   │
│             │ │ │                 PROPOSAL                        ││   │
│             │ │ │                                                 ││   │
│             │ │ │ Client A Website Redesign                      ││   │
│             │ │ │ Prepared by: Your Company Name                 ││   │
│             │ │ │ Date: October 1, 2023                          ││   │
│             │ │ │                                                 ││   │
│             │ │ │ [Table of Contents]                            ││   │
│             │ │ │ 1. Executive Summary                           ││   │
│             │ │ │ 2. Problem Statement                           ││   │
│             │ │ │ 3. Proposed Solution                           ││   │
│             │ │ │ 4. Scope of Work                               ││   │
│             │ │ │ 5. Budget and Timeline                         ││   │
│             │ │ │ 6. Terms and Conditions                        ││   │
│             │ │ │                                                 ││   │
│             │ │ └─────────────────────────────────────────────────┘│   │
│             │ └─────────────────────────────────────────────────────┘   │
│             │                                                           │
│             │ Proposal Sections                                         │
│             │ ┌─────────────────────┐ ┌─────────────────────────────┐   │
│             │ │ Executive Summary   │ │ Our team will deliver a     │   │
│             │ └─────────────────────┘ │ modern, responsive website  │   │
│             │                         │ that meets all requirements.│   │
│             │ ┌─────────────────────┐ └─────────────────────────────┘   │
│             │ │ Problem Statement   │ ┌─────────────────────────────┐   │
│             │ └─────────────────────┘ │ The current website lacks   │   │
│             │                         │ mobile responsiveness and   │   │
│             │ ┌─────────────────────┐ │ modern design elements.     │   │
│             │ │ Proposed Solution   │ └─────────────────────────────┘   │
│             │ └─────────────────────┘                                   │
│             │                                                           │
│             │ AI Generation: ┌──────────┐ ┌───────────┐ ┌───────────┐   │
│             │               │▶️ Generate│ │ 🔄 Refresh │ │ 💡 Improve│   │
│             │               └──────────┘ └───────────┘ └───────────┘   │
│             │                                                           │
│             │ ┌──────────────┐ ┌──────────────┐ ┌──────────────────┐    │
│             │ │ 📄 Export PDF│ │ 📝 Export DOCX│ │ ✉️ Send Proposal │    │
│             │ └──────────────┘ └──────────────┘ └──────────────────┘    │
└─────────────┴───────────────────────────────────────────────────────────┘
```

**Vylepšení:**
- Přidán interaktivní náhled návrhu s možností přepínat mezi formáty (Web, PDF, DOCX)
- Přidán obsah návrhu pro lepší navigaci
- Přidány tlačítka pro AI generování, obnovení a vylepšení návrhu
- Přidány ikony k tlačítkům exportu a odeslání
- Drobečková navigace pro lepší orientaci
- Přehlednější rozložení s více informacemi
- Možnost editovat jednotlivé sekce návrhu

### Mobilní zobrazení - Proposal Preview

```
┌───────────────────────┐
│ Proposal Manager    ☰ │
│                       │
│ Client A Website      │
│ Proposal              │
│                       │
│ ┌─────────────────┐   │
│ │Det│Req│Arc│Bud│Pro│ │
│ └─────────────────┘   │
│                       │
│ Proposal Preview      │
│ ┌─────────────────┐   │
│ │ Web│PDF│DOCX    │   │
│ └─────────────────┘   │
│ ┌─────────────────┐   │
│ │                 │   │
│ │    PROPOSAL     │   │
│ │                 │   │
│ │ Client A Website│   │
│ │ Redesign        │   │
│ │                 │   │
│ │ [Preview of     │   │
│ │  proposal       │   │
│ │  content]       │   │
│ │                 │   │
│ └─────────────────┘   │
│                       │
│ Sections:             │
│ ┌─────────────────┐   │
│ │ Executive Summary   │
│ │ Our team will...│   │
│ └─────────────────┘   │
│                       │
│ AI Generation:        │
│ ┌─────┐┌─────┐┌─────┐ │
│ │▶️ Gen││🔄 Ref││💡 Imp│ │
│ └─────┘└─────┘└─────┘ │
│                       │
│ ┌─────┐┌─────┐┌─────┐ │
│ │📄 PDF││📝 DOC││✉️ Send│ │
│ └─────┘└─────┘└─────┘ │
│                       │
│ 📊 📁 📑 👥 ⚙️         │
└───────────────────────┘
```

**Vylepšení pro mobilní zobrazení:**
- Zjednodušený náhled návrhu optimalizovaný pro malou obrazovku
- Záložky pro přepínání mezi formáty náhledu
- Kompaktní zobrazení sekcí návrhu
- Zkrácené záložky pro úsporu místa
- Kompaktní tlačítka pro AI generování a export
- Swipe gesta pro přechod mezi sekcemi návrhu (není viditelné v ASCII)

## Tmavý režim - Ukázka

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
│  🔆 Light Mode│ │  ⬤ Draft (5)         │          │   added to "Mobile │ │
│             │ │  ⬤ Analysis (3)       │          │   App Project"     │ │
│             │ │  ⬤ Architecture (2)   │          │ • Proposal for     │ │
│             │ │  ⬤ Planning (1)       │          │   "E-commerce      │ │
│             │ │  ⬤ Sales (1)          │          │   Platform" was    │ │
│             │ │  ⬤ Completed (8)      │          │   exported         │ │
│             │ └───────────────────────┘          └───────────────────┘ │
└─────────────┴───────────────────────────────────────────────────────────┘
```

**Vylepšení tmavého režimu:**
- Tmavé pozadí s kontrastním textem pro lepší čitelnost v noci
- Přepínač pro návrat do světlého režimu
- Zachování všech funkcí a rozložení
- Optimalizované barvy grafů a ikon pro tmavý režim
