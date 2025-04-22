# Proposal Manager Application Design

## Overview
The Proposal Manager is an AI-powered application designed to streamline the process of creating proposals based on client requirements. The system leverages four specialized AI agents (Analyst, Architect, Project Manager, and Sales Representative) to automate different stages of the proposal creation process.

## System Architecture

### High-Level Architecture
```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   Client UI     │────▶│   API Gateway   │────▶│  Authentication │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                               │
         ┌───────────────────┬─┴───────────────┬───────────────────┐
         ▼                   ▼                 ▼                   ▼
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│  Project Service│  │ Document Service│  │  Agent Service  │  │ Proposal Service│
└─────────────────┘  └─────────────────┘  └─────────────────┘  └─────────────────┘
         │                   │                   │                      │
         └───────────────────┴───────────────────┴──────────────────────┘
                                      │
                                      ▼
                           ┌─────────────────────┐
                           │      Database       │
                           └─────────────────────┘
                                      │
                                      ▼
                           ┌─────────────────────┐
                           │    LLM API Service  │
                           └─────────────────────┘
```

### Technology Stack
- **Frontend**: Vue.js
- **Backend**: Python with FastAPI
- **Database**: Supabase (PostgreSQL with built-in authentication)
- **Authentication**: Supabase Auth with OAuth support (Google)
- **LLM Integration**: OpenAI API
- **UI Framework**: Vuetify with dark/light mode support
- **File Storage**: Local file system with drag & drop support
- **Deployment**: Docker containers
- **Charts & Visualization**: Chart.js for data visualization, Vue Gantt for timeline

## Database Schema (Supabase/PostgreSQL)

### users Table
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  username TEXT NOT NULL UNIQUE,
  email TEXT NOT NULL UNIQUE,
  role TEXT NOT NULL CHECK (role IN ('admin', 'manager', 'user')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
-- Note: Authentication is handled by Supabase Auth
```

### clients Table
```sql
CREATE TABLE clients (
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
```

### projects Table
```sql
CREATE TABLE projects (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  description TEXT,
  client_id UUID REFERENCES clients(id),
  status TEXT NOT NULL CHECK (status IN ('draft', 'analysis', 'architecture', 'planning', 'sales', 'completed')),
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### documents Table
```sql
CREATE TABLE documents (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  file_name TEXT NOT NULL,
  file_type TEXT NOT NULL,
  file_size INTEGER NOT NULL,
  storage_path TEXT NOT NULL,
  extracted_text TEXT,
  uploaded_by UUID REFERENCES users(id),
  uploaded_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### requirements Table
```sql
CREATE TABLE requirements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  analysis_notes TEXT,
  completed_at TIMESTAMP WITH TIME ZONE
);
```

### requirement_items Table
```sql
CREATE TABLE requirement_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  requirement_id UUID REFERENCES requirements(id) ON DELETE CASCADE,
  description TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('functional', 'non-functional')),
  priority TEXT NOT NULL CHECK (priority IN ('high', 'medium', 'low')),
  status TEXT NOT NULL CHECK (status IN ('proposed', 'approved', 'rejected')),
  ai_generated BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  created_by UUID REFERENCES users(id)
);
```

### architecture Table
```sql
CREATE TABLE architecture (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  overview TEXT,
  technical_specification TEXT,
  completed_at TIMESTAMP WITH TIME ZONE
);
```

### components Table
```sql
CREATE TABLE components (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  architecture_id UUID REFERENCES architecture(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT,
  technology TEXT,
  complexity TEXT CHECK (complexity IN ('high', 'medium', 'low')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### component_dependencies Table
```sql
CREATE TABLE component_dependencies (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  component_id UUID REFERENCES components(id) ON DELETE CASCADE,
  depends_on_id UUID REFERENCES components(id) ON DELETE CASCADE,
  UNIQUE(component_id, depends_on_id)
);
```

### diagrams Table
```sql
CREATE TABLE diagrams (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  architecture_id UUID REFERENCES architecture(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  storage_path TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### budgets Table
```sql
CREATE TABLE budgets (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  total_cost DECIMAL(10,2),
  currency TEXT DEFAULT 'USD',
  start_date DATE,
  end_date DATE,
  completed_at TIMESTAMP WITH TIME ZONE
);
```

### roles Table
```sql
CREATE TABLE roles (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  budget_id UUID REFERENCES budgets(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  rate_per_day DECIMAL(10,2) NOT NULL,
  currency TEXT DEFAULT 'USD'
);
```

### budget_items Table
```sql
CREATE TABLE budget_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  budget_id UUID REFERENCES budgets(id) ON DELETE CASCADE,
  component_id UUID REFERENCES components(id),
  role_id UUID REFERENCES roles(id),
  days DECIMAL(5,2) NOT NULL,
  cost DECIMAL(10,2) NOT NULL
);
```

### milestones Table
```sql
CREATE TABLE milestones (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  budget_id UUID REFERENCES budgets(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  date DATE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### milestone_deliverables Table
```sql
CREATE TABLE milestone_deliverables (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  milestone_id UUID REFERENCES milestones(id) ON DELETE CASCADE,
  description TEXT NOT NULL
);
```

### proposals Table
```sql
CREATE TABLE proposals (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  executive_summary TEXT,
  company_introduction TEXT,
  problem_statement TEXT,
  proposed_solution TEXT,
  scope_of_work TEXT,
  terms_and_conditions TEXT,
  generated_proposal_path TEXT,
  completed_at TIMESTAMP WITH TIME ZONE
);
```

### proposal_deliverables Table
```sql
CREATE TABLE proposal_deliverables (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  proposal_id UUID REFERENCES proposals(id) ON DELETE CASCADE,
  description TEXT NOT NULL
);
```

### comments Table
```sql
CREATE TABLE comments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  entity_type TEXT NOT NULL CHECK (entity_type IN ('requirement', 'architecture', 'budget', 'proposal', 'project')),
  entity_id UUID NOT NULL,
  content TEXT NOT NULL,
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### templates Table
```sql
CREATE TABLE templates (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  description TEXT,
  type TEXT NOT NULL CHECK (type IN ('project', 'requirement', 'architecture', 'proposal')),
  content JSONB NOT NULL,
  created_by UUID REFERENCES users(id),
  is_public BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### user_settings Table
```sql
CREATE TABLE user_settings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  theme TEXT DEFAULT 'light' CHECK (theme IN ('light', 'dark')),
  language TEXT DEFAULT 'en',
  notification_preferences JSONB DEFAULT '{"email": true, "in_app": true}'::jsonb,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### notifications Table
```sql
CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('info', 'warning', 'success', 'error')),
  is_read BOOLEAN DEFAULT FALSE,
  entity_type TEXT,
  entity_id UUID,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

## AI Agents

### 1. Analyst Agent
**Purpose**: Analyze requirement documents and extract structured requirements.

**Capabilities**:
- Document parsing and text extraction
- Requirement identification and categorization
- Functional vs. non-functional requirement classification
- Requirement prioritization suggestion
- Gap analysis and additional requirement suggestion

**Prompt Template**:
```
You are an expert Business Analyst. Analyze the following document and extract all requirements.
For each requirement:
1. Provide a clear, concise description
2. Classify as functional or non-functional
3. Suggest a priority (high, medium, low)

Document:
{document_text}

Format your response as a JSON array of requirements.
```

### 2. Architect Agent
**Purpose**: Design system architecture and technical specifications based on requirements.

**Capabilities**:
- Architecture design based on requirements
- Component identification and description
- Technology stack recommendation
- Dependency mapping between components
- Technical specification generation

**Prompt Template**:
```
You are an expert Solution Architect. Based on the following requirements, design a system architecture.

Requirements:
{requirements_json}

For each requirement:
1. Identify necessary components to fulfill the requirement
2. Suggest appropriate technologies
3. Define dependencies between components
4. Assess complexity of implementation

Also provide a high-level technical specification document.

Format your response as a JSON object with architecture overview, components array, and technical specification.
```

### 3. Project Manager Agent
**Purpose**: Create project plans, timelines, and budgets based on architecture.

**Capabilities**:
- Effort estimation for components
- Resource allocation planning
- Cost calculation based on role rates
- Timeline and milestone generation
- Risk assessment and mitigation planning

**Prompt Template**:
```
You are an expert Project Manager. Based on the following architecture and components, create a project plan and budget.

Architecture:
{architecture_json}

Available roles and rates:
{roles_json}

For each component:
1. Estimate effort in person-days
2. Assign appropriate roles
3. Calculate costs

Also create a project timeline with milestones.

Format your response as a JSON object with line items, total cost, and timeline.
```

### 4. Sales Representative Agent
**Purpose**: Generate the final proposal with executive summary and value proposition.

**Capabilities**:
- Executive summary generation
- Value proposition articulation
- Proposal compilation and formatting
- Client-specific customization
- Competitive advantage highlighting

**Prompt Template**:
```
You are an expert Sales Representative. Create a compelling proposal based on the following information.

Project details:
{project_json}

Requirements:
{requirements_json}

Architecture:
{architecture_json}

Budget and timeline:
{budget_json}

Create:
1. An executive summary highlighting key benefits
2. A clear problem statement
3. A compelling proposed solution
4. A concise scope of work
5. A list of deliverables
6. Terms and conditions

Format your response as a JSON object with all proposal sections.
```

## User Interface Design

### Global UI Features
- Responsive design for desktop, tablet, and mobile devices
- Dark/light mode toggle
- Sidebar navigation with intuitive icons
- Breadcrumb navigation for better context
- Notification system for important events
- Bottom navigation for mobile devices
- Keyboard shortcuts for common actions
- Consistent color coding for status, priority, and complexity

### 1. Authentication
- Login screen with username/password authentication
- OAuth integration (Google login)
- Remember me functionality
- Password recovery
- Registration form

### 2. Project Dashboard
- Statistical cards showing key metrics (active projects, draft proposals, etc.)
- Project status visualization with pie chart
- Recent activity feed
- Project list with color-coded status indicators
- Quick actions (create, edit, delete)
- Advanced filtering and sorting options
- Project progress visualization

### 3. Project Creation
- Step-by-step wizard interface (Basic Info, Requirements, Team, Review)
- Project name and description fields
- Client selection dropdown
- Document upload with drag & drop support
- Template selection for quick start
- Clear navigation between wizard steps

### 4. Requirements Management
- Requirements list with icons for type and color-coded priority indicators
- Inline editing functionality
- Add new requirement manually
- AI analysis controls (Analyze, Refresh, Import)
- Approve/reject AI-suggested requirements
- Comments section for team discussion
- Drag-and-drop reordering of requirements
- Progress to next phase button

### 5. Architecture View
- Architecture overview section with rich text editor
- Interactive system diagram visualization
- Component list with color-coded complexity indicators
- AI design controls (Generate, Refresh, Import)
- Technical specification viewer/editor
- Diagram upload and visualization
- Component dependency visualization
- Progress to next phase button

### 6. Budget Planning
- Budget summary cards (total cost, start/end dates)
- Role rate configuration with inline editing
- Component effort estimation
- Cost calculation and summary
- Timeline visualization with interactive Gantt chart
- Milestone visualization on timeline
- AI planning controls (Generate, Refresh, Import)
- Progress to next phase button

### 7. Proposal Preview
- Interactive proposal preview with format switching (Web, PDF, DOCX)
- Table of contents navigation
- Section editing capability with rich text editor
- AI generation controls (Generate, Refresh, Improve)
- Export to PDF/Word with custom styling
- Send proposal functionality via email
- Mark as completed button

### 8. Client Management
- Client list with search and filter
- Client details view
- Contact information management
- Project history per client
- Notes and communication log

### 9. Template Management
- Template gallery with preview
- Template creation and editing
- Category organization
- Template sharing and permissions

### 10. User Settings
- Profile management
- Notification preferences
- UI preferences (dark/light mode, language)
- API key management for integrations

## API Endpoints (FastAPI)

### Authentication
- Authentication is handled by Supabase Auth
- FastAPI will use Supabase JWT tokens for authorization

### Projects
```python
@app.get("/api/projects/", response_model=List[ProjectSchema])
async def list_projects(current_user: User = Depends(get_current_user)):
    """List all projects for the current user"""

@app.post("/api/projects/", response_model=ProjectSchema, status_code=201)
async def create_project(project: ProjectCreate, current_user: User = Depends(get_current_user)):
    """Create a new project"""

@app.get("/api/projects/{project_id}", response_model=ProjectDetailSchema)
async def get_project(project_id: UUID, current_user: User = Depends(get_current_user)):
    """Get project details"""

@app.put("/api/projects/{project_id}", response_model=ProjectSchema)
async def update_project(project_id: UUID, project: ProjectUpdate, current_user: User = Depends(get_current_user)):
    """Update project details"""

@app.delete("/api/projects/{project_id}", status_code=204)
async def delete_project(project_id: UUID, current_user: User = Depends(get_current_user)):
    """Delete a project"""

@app.put("/api/projects/{project_id}/status", response_model=ProjectSchema)
async def update_project_status(project_id: UUID, status: ProjectStatusUpdate, current_user: User = Depends(get_current_user)):
    """Update project status"""
```

### Documents
```python
@app.post("/api/documents/", response_model=DocumentSchema, status_code=201)
async def upload_document(project_id: UUID = Form(...), file: UploadFile = File(...), current_user: User = Depends(get_current_user)):
    """Upload a document to a project"""

@app.get("/api/documents/{document_id}", response_model=DocumentSchema)
async def get_document(document_id: UUID, current_user: User = Depends(get_current_user)):
    """Get document details"""

@app.get("/api/documents/{document_id}/download")
async def download_document(document_id: UUID, current_user: User = Depends(get_current_user)):
    """Download a document"""

@app.delete("/api/documents/{document_id}", status_code=204)
async def delete_document(document_id: UUID, current_user: User = Depends(get_current_user)):
    """Delete a document"""

@app.post("/api/documents/{document_id}/extract", response_model=DocumentExtractSchema)
async def extract_document_text(document_id: UUID, current_user: User = Depends(get_current_user)):
    """Extract text from a document"""
```

### Clients
```python
@app.get("/api/clients/", response_model=List[ClientSchema])
async def list_clients(current_user: User = Depends(get_current_user)):
    """List all clients"""

@app.post("/api/clients/", response_model=ClientSchema, status_code=201)
async def create_client(client: ClientCreate, current_user: User = Depends(get_current_user)):
    """Create a new client"""

@app.get("/api/clients/{client_id}", response_model=ClientDetailSchema)
async def get_client(client_id: UUID, current_user: User = Depends(get_current_user)):
    """Get client details"""

@app.put("/api/clients/{client_id}", response_model=ClientSchema)
async def update_client(client_id: UUID, client: ClientUpdate, current_user: User = Depends(get_current_user)):
    """Update client details"""

@app.delete("/api/clients/{client_id}", status_code=204)
async def delete_client(client_id: UUID, current_user: User = Depends(get_current_user)):
    """Delete a client"""
```

### Templates
```python
@app.get("/api/templates/", response_model=List[TemplateSchema])
async def list_templates(current_user: User = Depends(get_current_user)):
    """List all templates"""

@app.post("/api/templates/", response_model=TemplateSchema, status_code=201)
async def create_template(template: TemplateCreate, current_user: User = Depends(get_current_user)):
    """Create a new template"""

@app.get("/api/templates/{template_id}", response_model=TemplateDetailSchema)
async def get_template(template_id: UUID, current_user: User = Depends(get_current_user)):
    """Get template details"""

@app.put("/api/templates/{template_id}", response_model=TemplateSchema)
async def update_template(template_id: UUID, template: TemplateUpdate, current_user: User = Depends(get_current_user)):
    """Update template details"""

@app.delete("/api/templates/{template_id}", status_code=204)
async def delete_template(template_id: UUID, current_user: User = Depends(get_current_user)):
    """Delete a template"""
```

### Comments
```python
@app.get("/api/comments/{entity_type}/{entity_id}", response_model=List[CommentSchema])
async def list_comments(entity_type: str, entity_id: UUID, current_user: User = Depends(get_current_user)):
    """List all comments for an entity"""

@app.post("/api/comments/{entity_type}/{entity_id}", response_model=CommentSchema, status_code=201)
async def create_comment(entity_type: str, entity_id: UUID, comment: CommentCreate, current_user: User = Depends(get_current_user)):
    """Create a new comment"""

@app.put("/api/comments/{comment_id}", response_model=CommentSchema)
async def update_comment(comment_id: UUID, comment: CommentUpdate, current_user: User = Depends(get_current_user)):
    """Update a comment"""

@app.delete("/api/comments/{comment_id}", status_code=204)
async def delete_comment(comment_id: UUID, current_user: User = Depends(get_current_user)):
    """Delete a comment"""
```

### User Settings
```python
@app.get("/api/user/settings", response_model=UserSettingsSchema)
async def get_user_settings(current_user: User = Depends(get_current_user)):
    """Get user settings"""

@app.put("/api/user/settings", response_model=UserSettingsSchema)
async def update_user_settings(settings: UserSettingsUpdate, current_user: User = Depends(get_current_user)):
    """Update user settings"""

@app.get("/api/user/notifications", response_model=List[NotificationSchema])
async def list_notifications(current_user: User = Depends(get_current_user)):
    """List user notifications"""

@app.put("/api/user/notifications/{notification_id}/read", status_code=204)
async def mark_notification_read(notification_id: UUID, current_user: User = Depends(get_current_user)):
    """Mark notification as read"""
```

### AI Agents
```python
@app.post("/api/agents/analyst/analyze", response_model=RequirementsSchema)
async def analyze_requirements(project_id: UUID, current_user: User = Depends(get_current_user)):
    """Trigger Analyst agent to analyze requirements"""

@app.post("/api/agents/architect/design", response_model=ArchitectureSchema)
async def design_architecture(project_id: UUID, current_user: User = Depends(get_current_user)):
    """Trigger Architect agent to design architecture"""

@app.post("/api/agents/manager/plan", response_model=BudgetSchema)
async def plan_project(project_id: UUID, current_user: User = Depends(get_current_user)):
    """Trigger Project Manager agent to create budget and timeline"""

@app.post("/api/agents/sales/propose", response_model=ProposalSchema)
async def create_proposal(project_id: UUID, current_user: User = Depends(get_current_user)):
    """Trigger Sales Representative agent to create proposal"""
```

### Requirements
```python
@app.get("/api/requirements/{project_id}", response_model=RequirementsDetailSchema)
async def get_requirements(project_id: UUID, current_user: User = Depends(get_current_user)):
    """Get requirements for a project"""

@app.post("/api/requirements/{project_id}/items", response_model=RequirementItemSchema, status_code=201)
async def create_requirement_item(project_id: UUID, requirement: RequirementItemCreate, current_user: User = Depends(get_current_user)):
    """Create a new requirement item"""

@app.put("/api/requirements/{project_id}/items/{item_id}", response_model=RequirementItemSchema)
async def update_requirement_item(project_id: UUID, item_id: UUID, requirement: RequirementItemUpdate, current_user: User = Depends(get_current_user)):
    """Update a requirement item"""

@app.delete("/api/requirements/{project_id}/items/{item_id}", status_code=204)
async def delete_requirement_item(project_id: UUID, item_id: UUID, current_user: User = Depends(get_current_user)):
    """Delete a requirement item"""
```

### Architecture
```python
@app.get("/api/architecture/{project_id}", response_model=ArchitectureDetailSchema)
async def get_architecture(project_id: UUID, current_user: User = Depends(get_current_user)):
    """Get architecture for a project"""

@app.put("/api/architecture/{project_id}", response_model=ArchitectureSchema)
async def update_architecture(project_id: UUID, architecture: ArchitectureUpdate, current_user: User = Depends(get_current_user)):
    """Update architecture overview and technical specification"""

@app.post("/api/architecture/{project_id}/components", response_model=ComponentSchema, status_code=201)
async def create_component(project_id: UUID, component: ComponentCreate, current_user: User = Depends(get_current_user)):
    """Create a new component"""

@app.put("/api/architecture/{project_id}/components/{component_id}", response_model=ComponentSchema)
async def update_component(project_id: UUID, component_id: UUID, component: ComponentUpdate, current_user: User = Depends(get_current_user)):
    """Update a component"""

@app.delete("/api/architecture/{project_id}/components/{component_id}", status_code=204)
async def delete_component(project_id: UUID, component_id: UUID, current_user: User = Depends(get_current_user)):
    """Delete a component"""

@app.post("/api/architecture/{project_id}/diagrams", response_model=DiagramSchema, status_code=201)
async def upload_diagram(project_id: UUID, name: str = Form(...), file: UploadFile = File(...), current_user: User = Depends(get_current_user)):
    """Upload a diagram"""
```

### Budget
```python
@app.get("/api/budget/{project_id}", response_model=BudgetDetailSchema)
async def get_budget(project_id: UUID, current_user: User = Depends(get_current_user)):
    """Get budget for a project"""

@app.put("/api/budget/{project_id}", response_model=BudgetSchema)
async def update_budget(project_id: UUID, budget: BudgetUpdate, current_user: User = Depends(get_current_user)):
    """Update budget details"""

@app.post("/api/budget/{project_id}/roles", response_model=RoleSchema, status_code=201)
async def create_role(project_id: UUID, role: RoleCreate, current_user: User = Depends(get_current_user)):
    """Create a new role"""

@app.put("/api/budget/{project_id}/roles/{role_id}", response_model=RoleSchema)
async def update_role(project_id: UUID, role_id: UUID, role: RoleUpdate, current_user: User = Depends(get_current_user)):
    """Update a role"""

@app.delete("/api/budget/{project_id}/roles/{role_id}", status_code=204)
async def delete_role(project_id: UUID, role_id: UUID, current_user: User = Depends(get_current_user)):
    """Delete a role"""

@app.post("/api/budget/{project_id}/items", response_model=BudgetItemSchema, status_code=201)
async def create_budget_item(project_id: UUID, item: BudgetItemCreate, current_user: User = Depends(get_current_user)):
    """Create a new budget item"""

@app.put("/api/budget/{project_id}/items/{item_id}", response_model=BudgetItemSchema)
async def update_budget_item(project_id: UUID, item_id: UUID, item: BudgetItemUpdate, current_user: User = Depends(get_current_user)):
    """Update a budget item"""

@app.delete("/api/budget/{project_id}/items/{item_id}", status_code=204)
async def delete_budget_item(project_id: UUID, item_id: UUID, current_user: User = Depends(get_current_user)):
    """Delete a budget item"""

@app.post("/api/budget/{project_id}/milestones", response_model=MilestoneSchema, status_code=201)
async def create_milestone(project_id: UUID, milestone: MilestoneCreate, current_user: User = Depends(get_current_user)):
    """Create a new milestone"""
```

### Proposals
```python
@app.get("/api/proposals/{project_id}", response_model=ProposalDetailSchema)
async def get_proposal(project_id: UUID, current_user: User = Depends(get_current_user)):
    """Get proposal for a project"""

@app.put("/api/proposals/{project_id}", response_model=ProposalSchema)
async def update_proposal(project_id: UUID, proposal: ProposalUpdate, current_user: User = Depends(get_current_user)):
    """Update proposal details"""

@app.post("/api/proposals/{project_id}/deliverables", response_model=ProposalDeliverableSchema, status_code=201)
async def create_proposal_deliverable(project_id: UUID, deliverable: ProposalDeliverableCreate, current_user: User = Depends(get_current_user)):
    """Create a new proposal deliverable"""

@app.post("/api/proposals/{project_id}/export")
async def export_proposal(project_id: UUID, format: str = Query("pdf", regex="^(pdf|docx)$"), current_user: User = Depends(get_current_user)):
    """Export proposal as PDF or DOCX"""

@app.post("/api/proposals/{project_id}/send", status_code=204)
async def send_proposal(project_id: UUID, email_data: ProposalEmailData, current_user: User = Depends(get_current_user)):
    """Send proposal via email"""
```

## Implementation Plan

### Phase 1: Core Infrastructure (2 weeks)
- Set up Vue.js frontend project structure with Vuetify
- Implement responsive layout with dark/light mode support
- Set up FastAPI backend project structure
- Configure Supabase database and authentication with OAuth
- Create database schema and migrations
- Implement user authentication with Supabase Auth
- Create basic API endpoints in FastAPI
- Set up local file storage system with drag & drop support
- Set up CI/CD pipeline

### Phase 2: Dashboard and Client Management (2 weeks)
- Develop dashboard with statistical cards and charts
- Implement project listing with filtering and sorting
- Create client management module
- Develop activity feed functionality
- Implement notification system
- Create user settings and preferences

### Phase 3: Document Processing and Analysis (3 weeks)
- Implement document upload with drag & drop support
- Develop document text extraction functionality
- Implement OpenAI API integration for Analyst agent
- Create requirements management UI with inline editing
- Implement requirement categorization with visual indicators
- Develop commenting system for requirements
- Create AI analysis controls and visualization

### Phase 4: Architecture Design (3 weeks)
- Develop Architect agent integration with OpenAI API
- Create interactive architecture diagram visualization
- Implement component management UI with color-coded complexity
- Develop technical specification editor with rich text support
- Implement diagram upload and visualization
- Create AI design controls and visualization

### Phase 5: Project Planning (2 weeks)
- Develop Project Manager agent integration with OpenAI API
- Create budget calculation functionality with summary cards
- Implement interactive Gantt chart for timeline visualization
- Develop role rate management UI with inline editing
- Implement milestone and deliverable management
- Create AI planning controls and visualization

### Phase 6: Proposal Generation and Templates (3 weeks)
- Develop Sales Representative agent integration with OpenAI API
- Create interactive proposal preview with format switching
- Implement rich text editing for proposal sections
- Develop PDF/DOCX export functionality with custom styling
- Implement proposal sending capability via email
- Create template management system
- Develop AI generation controls with improvement suggestions

### Phase 7: Mobile Optimization and Advanced Features (2 weeks)
- Optimize all interfaces for mobile devices
- Implement bottom navigation for mobile
- Add swipe gestures for navigation
- Implement keyboard shortcuts
- Create drag-and-drop functionality for reordering
- Develop advanced filtering and search capabilities

### Phase 8: Integration and Testing (2 weeks)
- End-to-end integration testing with Pytest and Vue Test Utils
- Performance optimization
- Security testing and hardening
- User acceptance testing
- Cross-browser and cross-device compatibility testing

### Phase 9: Deployment and Documentation (1 week)
- Docker containerization
- Production deployment
- User documentation with screenshots
- Admin documentation
- Training materials and video tutorials

## Security Considerations
- Leverage Supabase Auth for authentication and authorization
- Implement Row Level Security (RLS) in Supabase for data access control
- Role-based access control using Supabase policies
- Data encryption at rest and in transit
- Regular security audits
- Input validation and sanitization using Pydantic models in FastAPI
- Rate limiting for API endpoints
- OWASP top 10 vulnerability protection
- Secure file handling for local storage
- Environment variable management for sensitive configuration

## Scalability Considerations
- FastAPI's asynchronous request handling for improved performance
- Supabase PostgreSQL database optimization
- Caching layer for frequently accessed data
- Asynchronous processing for long-running tasks and AI agent operations
- Horizontal scaling capability through Docker containers
- Optimized file storage with potential to migrate to cloud storage as needed
- Database connection pooling
- Efficient API design with pagination for large datasets

## Future Enhancements
- AI-powered proposal optimization and improvement suggestions
- Integration with CRM systems and project management tools
- Client feedback collection and analysis dashboard
- Advanced proposal template library with categorization
- Competitive analysis integration and market research
- Automated follow-up system with scheduling
- Multi-language support with automatic translation
- Collaborative editing with real-time updates
- Advanced analytics and reporting dashboard
- Mobile application for on-the-go access
- Voice commands for hands-free operation
- Integration with video conferencing for client presentations
- Blockchain-based proposal verification and signing
- Machine learning for proposal success prediction
