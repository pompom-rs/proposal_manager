-- Proposal Manager - Databázové schéma
-- Tento skript vytvoří schému proposal_manager a základní tabulky pro aplikaci Proposal Manager

-- Vytvoření schémy proposal_manager
CREATE SCHEMA IF NOT EXISTS proposal_manager;

-- Nastavení vyhledávací cesty pro schému proposal_manager
SET search_path TO proposal_manager, public;

-- Povolení UUID rozšíření
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Vytvoření tabulky users
CREATE TABLE IF NOT EXISTS proposal_manager.users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  username TEXT NOT NULL UNIQUE,
  email TEXT NOT NULL UNIQUE,
  role TEXT NOT NULL CHECK (role IN ('admin', 'manager', 'user')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky clients
CREATE TABLE IF NOT EXISTS proposal_manager.clients (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  description TEXT,
  contact_person TEXT,
  email TEXT,
  phone TEXT,
  address TEXT,
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky projects
CREATE TABLE IF NOT EXISTS proposal_manager.projects (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  description TEXT,
  client_id UUID REFERENCES proposal_manager.clients(id),
  status TEXT NOT NULL CHECK (status IN ('draft', 'analysis', 'architecture', 'planning', 'sales', 'completed')),
  created_by UUID REFERENCES proposal_manager.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky documents
CREATE TABLE IF NOT EXISTS proposal_manager.documents (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID REFERENCES proposal_manager.projects(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  file_path TEXT NOT NULL,
  file_type TEXT NOT NULL,
  file_size INTEGER NOT NULL,
  uploaded_by UUID REFERENCES proposal_manager.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky requirements
CREATE TABLE IF NOT EXISTS proposal_manager.requirements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID REFERENCES proposal_manager.projects(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT,
  created_by UUID REFERENCES proposal_manager.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky requirement_items
CREATE TABLE IF NOT EXISTS proposal_manager.requirement_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  requirement_id UUID REFERENCES proposal_manager.requirements(id) ON DELETE CASCADE,
  description TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('functional', 'non-functional')),
  priority TEXT NOT NULL CHECK (priority IN ('high', 'medium', 'low')),
  status TEXT NOT NULL CHECK (status IN ('proposed', 'approved', 'rejected')),
  ai_generated BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  created_by UUID REFERENCES proposal_manager.users(id)
);

-- Vytvoření tabulky architectures
CREATE TABLE IF NOT EXISTS proposal_manager.architectures (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID REFERENCES proposal_manager.projects(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT,
  created_by UUID REFERENCES proposal_manager.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky architecture_components
CREATE TABLE IF NOT EXISTS proposal_manager.architecture_components (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  architecture_id UUID REFERENCES proposal_manager.architectures(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT,
  technology TEXT,
  complexity TEXT CHECK (complexity IN ('low', 'medium', 'high')),
  created_by UUID REFERENCES proposal_manager.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky budgets
CREATE TABLE IF NOT EXISTS proposal_manager.budgets (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID REFERENCES proposal_manager.projects(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT,
  total_amount DECIMAL(12, 2) NOT NULL,
  currency TEXT NOT NULL DEFAULT 'USD',
  created_by UUID REFERENCES proposal_manager.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky budget_items
CREATE TABLE IF NOT EXISTS proposal_manager.budget_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  budget_id UUID REFERENCES proposal_manager.budgets(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT,
  amount DECIMAL(12, 2) NOT NULL,
  quantity INTEGER NOT NULL DEFAULT 1,
  unit TEXT,
  created_by UUID REFERENCES proposal_manager.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky proposals
CREATE TABLE IF NOT EXISTS proposal_manager.proposals (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID REFERENCES proposal_manager.projects(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT,
  status TEXT NOT NULL CHECK (status IN ('draft', 'review', 'approved', 'sent', 'accepted', 'rejected')),
  created_by UUID REFERENCES proposal_manager.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky proposal_sections
CREATE TABLE IF NOT EXISTS proposal_manager.proposal_sections (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  proposal_id UUID REFERENCES proposal_manager.proposals(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  content TEXT,
  order_index INTEGER NOT NULL,
  created_by UUID REFERENCES proposal_manager.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky proposal_deliverables
CREATE TABLE IF NOT EXISTS proposal_manager.proposal_deliverables (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  proposal_id UUID REFERENCES proposal_manager.proposals(id) ON DELETE CASCADE,
  description TEXT NOT NULL
);

-- Vytvoření tabulky comments
CREATE TABLE IF NOT EXISTS proposal_manager.comments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  entity_type TEXT NOT NULL CHECK (entity_type IN ('requirement', 'architecture', 'budget', 'proposal', 'project')),
  entity_id UUID NOT NULL,
  content TEXT NOT NULL,
  created_by UUID REFERENCES proposal_manager.users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky templates
CREATE TABLE IF NOT EXISTS proposal_manager.templates (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  description TEXT,
  type TEXT NOT NULL CHECK (type IN ('project', 'requirement', 'architecture', 'proposal')),
  content JSONB NOT NULL,
  created_by UUID REFERENCES proposal_manager.users(id),
  is_public BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky user_settings
CREATE TABLE IF NOT EXISTS proposal_manager.user_settings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES proposal_manager.users(id) ON DELETE CASCADE,
  theme TEXT DEFAULT 'light' CHECK (theme IN ('light', 'dark')),
  language TEXT DEFAULT 'en',
  notification_preferences JSONB DEFAULT '{"email": true, "in_app": true}'::jsonb,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Vytvoření tabulky notifications
CREATE TABLE IF NOT EXISTS proposal_manager.notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES proposal_manager.users(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('info', 'warning', 'success', 'error')),
  is_read BOOLEAN DEFAULT FALSE,
  entity_type TEXT,
  entity_id UUID,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Nastavení Row Level Security (RLS)

-- Povolení RLS pro všechny tabulky
ALTER TABLE proposal_manager.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.clients ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.requirements ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.requirement_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.architectures ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.architecture_components ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.budgets ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.budget_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.proposals ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.proposal_sections ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.proposal_deliverables ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.comments ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.templates ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.user_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposal_manager.notifications ENABLE ROW LEVEL SECURITY;

-- Vytvoření policy pro tabulku users
CREATE POLICY "Users can view their own data" ON proposal_manager.users
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Admins can view all users" ON proposal_manager.users
  FOR SELECT USING (auth.jwt() ->> 'role' = 'admin');

-- Vytvoření policy pro tabulku clients
CREATE POLICY "Users can view all clients" ON proposal_manager.clients
  FOR SELECT USING (true);

CREATE POLICY "Users can create clients" ON proposal_manager.clients
  FOR INSERT WITH CHECK (auth.uid() = created_by);

CREATE POLICY "Users can update their own clients" ON proposal_manager.clients
  FOR UPDATE USING (auth.uid() = created_by);

-- Vytvoření policy pro tabulku projects
CREATE POLICY "Users can view all projects" ON proposal_manager.projects
  FOR SELECT USING (true);

CREATE POLICY "Users can create projects" ON proposal_manager.projects
  FOR INSERT WITH CHECK (auth.uid() = created_by);

CREATE POLICY "Users can update their own projects" ON proposal_manager.projects
  FOR UPDATE USING (auth.uid() = created_by);

-- Vytvoření funkce pro získání verze PostgreSQL
CREATE OR REPLACE FUNCTION proposal_manager.get_postgres_version()
RETURNS text AS $$
BEGIN
  RETURN current_setting('server_version');
END;
$$ LANGUAGE plpgsql;
