CREATE EXTENSION IF NOT EXISTS vector;
CREATE TABLE companies (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name        TEXT NOT NULL,
  domain      TEXT UNIQUE,
  settings    JSONB DEFAULT '{}',
  created_at  TIMESTAMPTZ DEFAULT now()
);

INSERT INTO companies (name, domain)
VALUES ('MindMate', 'mindmate.com');


CREATE TABLE recruiters (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id  UUID REFERENCES companies(id) ON DELETE CASCADE,
  name        TEXT NOT NULL,
  email       TEXT UNIQUE NOT NULL,
  role        TEXT DEFAULT 'recruiter'
                CHECK (role IN ('recruiter','manager','admin')),
  created_at  TIMESTAMPTZ DEFAULT now()
);


CREATE TABLE jobs (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id            UUID REFERENCES companies(id) ON DELETE CASCADE,
  title                 TEXT NOT NULL,
  department            TEXT,
  requirements          JSONB NOT NULL DEFAULT '{}',
  education_requirement TEXT,
  status                TEXT DEFAULT 'active'
                          CHECK (status IN ('active','paused','closed')),
  created_by            UUID REFERENCES recruiters(id),
  created_at            TIMESTAMPTZ DEFAULT now()
);

INSERT INTO jobs (company_id, title, department, requirements, education_requirement, status)
SELECT id, 'Senior Backend Engineer', 'Engineering',
  '{
    "required":       ["Python", "AWS", "PostgreSQL", "REST APIs"],
    "nice_to_have":   ["Docker", "Kubernetes", "FastAPI"],
    "years_exp":      5,
    "required_certs": []
  }'::jsonb,
  'Bachelor''s degree in Computer Science or equivalent',
  'active'
FROM companies WHERE name = 'MindMate';

INSERT INTO jobs (company_id, title, department, requirements, education_requirement, status)
SELECT id, 'Frontend Developer', 'Engineering',
  '{
    "required":       ["React", "TypeScript", "CSS", "REST APIs"],
    "nice_to_have":   ["Next.js", "Tailwind", "GraphQL"],
    "years_exp":      3,
    "required_certs": []
  }'::jsonb,
  'Bachelor''s degree or equivalent experience',
  'active'
FROM companies WHERE name = 'MindMate';

INSERT INTO jobs (company_id, title, department, requirements, education_requirement, status)
SELECT id, 'Product Manager', 'Product',
  '{
    "required":       ["Product roadmap", "Agile", "Stakeholder management", "User research"],
    "nice_to_have":   ["SQL", "Figma", "A/B testing"],
    "years_exp":      3,
    "required_certs": []
  }'::jsonb,
  'Bachelor''s degree in Business, CS, or equivalent',
  'active'
FROM companies WHERE name = 'MindMate';

INSERT INTO jobs (company_id, title, department, requirements, education_requirement, status)
SELECT id, 'Data Analyst', 'Analytics',
  '{
    "required":       ["SQL", "Python", "Excel", "Data visualization"],
    "nice_to_have":   ["Tableau", "Power BI", "dbt", "BigQuery"],
    "years_exp":      2,
    "required_certs": []
  }'::jsonb,
  'Bachelor''s degree in Statistics, Math, CS, or equivalent',
  'active'
FROM companies WHERE name = 'MindMate';

INSERT INTO jobs (company_id, title, department, requirements, education_requirement, status)
SELECT id, 'DevOps Engineer', 'Infrastructure',
  '{
    "required":       ["Docker", "Kubernetes", "CI/CD", "Linux", "AWS"],
    "nice_to_have":   ["Terraform", "Helm", "Prometheus", "ArgoCD"],
    "years_exp":      3,
    "required_certs": ["AWS Certified or equivalent"]
  }'::jsonb,
  'Bachelor''s degree in CS or equivalent',
  'active'
FROM companies WHERE name = 'MindMate';

CREATE TABLE candidates (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  full_name         TEXT NOT NULL,
  email             TEXT NOT NULL,
  phone             TEXT,
  location          TEXT,
  linkedin_url      TEXT,
  portfolio_url     TEXT,
  source            TEXT,
  parsed_resume     JSONB,
  raw_resume_text   TEXT,
  resume_url        TEXT,
  created_at        TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE applications (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  candidate_id        UUID REFERENCES candidates(id) ON DELETE CASCADE,
  job_id              UUID REFERENCES jobs(id) ON DELETE CASCADE,
  company_id          UUID REFERENCES companies(id) ON DELETE CASCADE,
  status              TEXT DEFAULT 'applied'
                        CHECK (status IN (
                          'applied',
                          'screening',
                          'parsed',
                          'review_queue',
                          'shortlisted',
                          'interview',
                          'final_review',
                          'offer',
                          'hired',
                          'rejected',
                          'intake_failed',
                          'parsing_failed'
                        )),
  cover_letter        TEXT,
  years_experience    INT,
  recruiter_summary   TEXT,
  interview_questions JSONB,
  risk_flags          JSONB,
  assigned_recruiter  UUID REFERENCES recruiters(id),
  created_at          TIMESTAMPTZ DEFAULT now(),
  updated_at          TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE documents (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  candidate_id  UUID REFERENCES candidates(id) ON DELETE CASCADE,
  type          TEXT DEFAULT 'resume'
                  CHECK (type IN ('resume','cover_letter','portfolio','certificate','other')),
  filename      TEXT NOT NULL,
  storage_path  TEXT NOT NULL,
  mime_type     TEXT,
  size_bytes    INT,
  uploaded_at   TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE scores (
  id                   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  application_id       UUID REFERENCES applications(id) ON DELETE CASCADE,
  final_score          NUMERIC(5,2) NOT NULL,
  recommendation       TEXT NOT NULL
                         CHECK (recommendation IN (
                           'Strong Match',
                           'Potential Match',
                           'Needs Review',
                           'Not Qualified'
                         )),
  skills_score         NUMERIC(5,2),
  experience_score     NUMERIC(5,2),
  education_score      NUMERIC(5,2),
  cert_score           NUMERIC(5,2),
  requirements_score   NUMERIC(5,2),
  strengths            JSONB DEFAULT '[]',
  weaknesses           JSONB DEFAULT '[]',
  missing_requirements JSONB DEFAULT '[]',
  model_used           TEXT,
  evaluated_at         TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE knowledge_base (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id  UUID REFERENCES companies(id) ON DELETE CASCADE,
  job_id      UUID REFERENCES jobs(id),
  category    TEXT NOT NULL
                CHECK (category IN (
                  'job_desc',
                  'rubric',
                  'policy',
                  'skill_framework',
                  'interview_questions',
                  'evaluation_criteria'
                )),
  title       TEXT NOT NULL,
  content     TEXT NOT NULL,
  embedding   VECTOR(1536),
  metadata    JSONB DEFAULT '{}',
  created_at  TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE agent_logs (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  application_id    UUID REFERENCES applications(id),
  workflow_name     TEXT NOT NULL,
  model             TEXT NOT NULL,
  prompt_tokens     INT DEFAULT 0,
  completion_tokens INT DEFAULT 0,
  latency_ms        INT DEFAULT 0,
  raw_response      TEXT,
  error             TEXT,
  created_at        TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE activities (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  application_id  UUID REFERENCES applications(id) ON DELETE CASCADE,
  actor_id        TEXT,
  action          TEXT NOT NULL,
  metadata        JSONB DEFAULT '{}',
  created_at      TIMESTAMPTZ DEFAULT now()
);


CREATE INDEX idx_applications_status     ON applications(status);
CREATE INDEX idx_applications_job        ON applications(job_id);
CREATE INDEX idx_applications_candidate  ON applications(candidate_id);
CREATE INDEX idx_applications_company    ON applications(company_id);
CREATE INDEX idx_scores_application      ON scores(application_id);
CREATE INDEX idx_scores_final            ON scores(final_score DESC);
CREATE INDEX idx_activities_application  ON activities(application_id);
CREATE INDEX idx_candidates_email        ON candidates(email);
CREATE INDEX idx_agent_logs_application  ON agent_logs(application_id);

CREATE INDEX idx_kb_embedding
  ON knowledge_base
  USING ivfflat (embedding vector_cosine_ops)
  WITH (lists = 100);


INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'resumes',
  'resumes',
  false,
  5242880,
  ARRAY[
    'application/pdf',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  ]
)
ON CONFLICT (id) DO NOTHING;


ALTER TABLE companies      ENABLE ROW LEVEL SECURITY;
ALTER TABLE recruiters     ENABLE ROW LEVEL SECURITY;
ALTER TABLE jobs           ENABLE ROW LEVEL SECURITY;
ALTER TABLE candidates     ENABLE ROW LEVEL SECURITY;
ALTER TABLE applications   ENABLE ROW LEVEL SECURITY;
ALTER TABLE documents      ENABLE ROW LEVEL SECURITY;
ALTER TABLE scores         ENABLE ROW LEVEL SECURITY;
ALTER TABLE knowledge_base ENABLE ROW LEVEL SECURITY;
ALTER TABLE agent_logs     ENABLE ROW LEVEL SECURITY;
ALTER TABLE activities     ENABLE ROW LEVEL SECURITY;

CREATE POLICY "allow_all_for_testing" ON companies      FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_for_testing" ON recruiters     FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_for_testing" ON jobs           FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_for_testing" ON candidates     FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_for_testing" ON applications   FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_for_testing" ON documents      FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_for_testing" ON scores         FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_for_testing" ON knowledge_base FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_for_testing" ON agent_logs     FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_for_testing" ON activities     FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "allow_resume_uploads" ON storage.objects
  FOR INSERT WITH CHECK (bucket_id = 'resumes');

CREATE POLICY "allow_resume_reads" ON storage.objects
  FOR SELECT USING (bucket_id = 'resumes');


SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
