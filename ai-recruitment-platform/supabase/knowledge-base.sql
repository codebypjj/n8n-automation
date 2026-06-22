INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT 
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'rubric',
  'Senior Backend Engineer — Hiring Rubric',
  'Strong Match (85-100): Candidate has 5+ years Python, hands-on AWS experience, PostgreSQL schema design experience, and has built production REST APIs. Bonus for FastAPI, Docker, or Kubernetes experience.
Potential Match (70-84): Candidate meets core Python and REST API requirements but may lack AWS depth or PostgreSQL experience. Worth a technical screen.
Needs Review (50-69): Candidate has general backend experience but not specifically Python or AWS. Has potential but significant gaps.
Not Qualified (0-49): Less than 2 years experience, no Python, no cloud experience, or no evidence of building APIs.'
FROM jobs WHERE title = 'Senior Backend Engineer';

INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'skill_framework',
  'Senior Backend Engineer — Skill Framework',
  'Junior (0-2 years): Knows one language, builds simple CRUD APIs, learning databases.
Mid-level (2-5 years): Proficient in Python, designs REST APIs, comfortable with SQL, some cloud exposure.
Senior (5+ years): Architects distributed systems, deep AWS knowledge, PostgreSQL optimization, mentors others, leads technical decisions.
Staff (8+ years): Defines engineering standards, cross-team technical leadership, system design at scale.'
FROM jobs WHERE title = 'Senior Backend Engineer';

INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'interview_questions',
  'Senior Backend Engineer — Interview Questions',
  'Technical questions:
1. Walk me through how you would design a REST API for a high-traffic application.
2. How have you optimized PostgreSQL queries in production?
3. Describe your experience with AWS — which services have you used and for what purpose?
4. How do you handle database migrations in a live production system?
5. Explain the difference between horizontal and vertical scaling and when you would use each.

Behavioural questions:
1. Tell me about a time you had to refactor a large codebase. How did you approach it?
2. Describe a production incident you handled. What was your process?
3. How do you mentor junior engineers on your team?'
FROM jobs WHERE title = 'Senior Backend Engineer';

-- ============================================================
-- FRONTEND DEVELOPER
-- ============================================================
INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'rubric',
  'Frontend Developer — Hiring Rubric',
  'Strong Match (85-100): Candidate has 3+ years React and TypeScript, strong CSS skills, experience consuming REST APIs, and a portfolio showing real projects. Bonus for Next.js or Tailwind.
Potential Match (70-84): Solid React experience but limited TypeScript or no portfolio. Worth a technical screen.
Needs Review (50-69): Knows HTML/CSS/JS but limited React experience. Needs assessment.
Not Qualified (0-49): No React experience, less than 1 year experience, or no evidence of frontend work.'
FROM jobs WHERE title = 'Frontend Developer';

INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'skill_framework',
  'Frontend Developer — Skill Framework',
  'Junior (0-2 years): HTML, CSS, JavaScript basics, learning React.
Mid-level (2-4 years): Proficient React, TypeScript, state management, REST API integration, responsive design.
Senior (4+ years): Architecture decisions, performance optimization, accessibility, mentoring, design system ownership.'
FROM jobs WHERE title = 'Frontend Developer';

INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'interview_questions',
  'Frontend Developer — Interview Questions',
  'Technical questions:
1. How do you manage state in a large React application?
2. What is the difference between useMemo and useCallback?
3. How do you approach responsive design and cross-browser compatibility?
4. How have you improved frontend performance in past projects?
5. Explain TypeScript generics and when you would use them.

Behavioural questions:
1. Tell me about a challenging UI you built. What made it difficult?
2. How do you collaborate with designers and backend engineers?
3. Describe a time you improved the user experience of an existing feature.'
FROM jobs WHERE title = 'Frontend Developer';

-- ============================================================
-- PRODUCT MANAGER
-- ============================================================
INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'rubric',
  'Product Manager — Hiring Rubric',
  'Strong Match (85-100): Candidate has 3+ years PM experience, has owned a product roadmap end to end, has experience with Agile, conducts user research, and can show measurable product impact.
Potential Match (70-84): Has PM or associate PM experience, understands Agile, but limited roadmap ownership. Worth interviewing.
Needs Review (50-69): Business analyst or project manager background with some product exposure. Needs assessment.
Not Qualified (0-49): No product management experience, no evidence of working with engineering teams.'
FROM jobs WHERE title = 'Product Manager';

INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'interview_questions',
  'Product Manager — Interview Questions',
  'Technical questions:
1. How do you prioritize features when you have limited engineering resources?
2. Walk me through how you would write a product requirements document.
3. How do you measure the success of a product feature after launch?
4. Describe your experience running user research sessions.

Behavioural questions:
1. Tell me about a product decision you made that did not go as planned. What did you learn?
2. How do you handle disagreements with engineering about scope or timeline?
3. Describe how you have used data to influence a product decision.'
FROM jobs WHERE title = 'Product Manager';

-- ============================================================
-- DATA ANALYST
-- ============================================================
INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'rubric',
  'Data Analyst — Hiring Rubric',
  'Strong Match (85-100): Candidate has 2+ years experience, strong SQL, Python for data analysis, experience with data visualization tools, and has delivered insights that influenced business decisions.
Potential Match (70-84): Strong SQL and Excel but limited Python or visualization tool experience. Worth a technical screen.
Needs Review (50-69): Basic SQL and Excel skills but no Python or BI tool experience. Needs assessment.
Not Qualified (0-49): No SQL experience, no data analysis background.'
FROM jobs WHERE title = 'Data Analyst';

INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'interview_questions',
  'Data Analyst — Interview Questions',
  'Technical questions:
1. Write a SQL query to find the top 5 customers by revenue in the last 30 days.
2. How would you clean a dataset with missing values?
3. Explain the difference between a LEFT JOIN and an INNER JOIN.
4. How have you used Python for data analysis? Which libraries do you use?
5. How do you choose the right visualization for a dataset?

Behavioural questions:
1. Tell me about an insight you discovered that surprised stakeholders.
2. How do you communicate complex data findings to non-technical people?
3. Describe a time your analysis directly influenced a business decision.'
FROM jobs WHERE title = 'Data Analyst';

-- ============================================================
-- DEVOPS ENGINEER
-- ============================================================
INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'rubric',
  'DevOps Engineer — Hiring Rubric',
  'Strong Match (85-100): Candidate has 3+ years DevOps experience, Docker and Kubernetes in production, CI/CD pipeline ownership, Linux administration, and AWS certifications or deep AWS experience.
Potential Match (70-84): Docker and CI/CD experience but limited Kubernetes. Worth a technical screen.
Needs Review (50-69): Sysadmin or cloud background but limited container or automation experience. Needs assessment.
Not Qualified (0-49): No container experience, no CI/CD experience, or purely development background.'
FROM jobs WHERE title = 'DevOps Engineer';

INSERT INTO knowledge_base (company_id, job_id, category, title, content)
SELECT
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  id,
  'interview_questions',
  'DevOps Engineer — Interview Questions',
  'Technical questions:
1. Walk me through how you would set up a CI/CD pipeline from scratch.
2. How do you manage secrets and environment variables securely in Kubernetes?
3. Describe how you have used Terraform for infrastructure as code.
4. How do you monitor a production Kubernetes cluster?
5. What is your approach to zero-downtime deployments?

Behavioural questions:
1. Tell me about a major infrastructure incident you responded to. How did you handle it?
2. How do you balance speed of deployment with system stability?
3. Describe how you have improved developer experience through DevOps tooling.'
FROM jobs WHERE title = 'DevOps Engineer';

-- ============================================================
-- COMPANY-WIDE POLICIES (applies to all jobs)
-- ============================================================
INSERT INTO knowledge_base (company_id, job_id, category, title, content)
VALUES (
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  NULL,
  'policy',
  'MindMate — General Hiring Policy',
  'MindMate values continuous learners over credential collectors. A candidate with fewer years of experience but strong evidence of self-learning and real project impact is preferred over one with many years but stagnant growth.
Culture fit indicators: collaborative mindset, clear communication, ownership mentality, and comfort with ambiguity.
Red flags: multiple short tenures without explanation, no evidence of impact in previous roles, inability to explain technical concepts simply.
MindMate is a remote-first company. Candidates must demonstrate ability to work independently and communicate asynchronously.'
);

INSERT INTO knowledge_base (company_id, job_id, category, title, content)
VALUES (
  '6792585f-94be-4b5b-a6e4-9bc9296e796e',
  NULL,
  'evaluation_criteria',
  'MindMate — Candidate Evaluation Guidelines',
  'When evaluating any candidate, consider these factors in order of priority:
1. Technical skills match — does the candidate have the core required skills?
2. Experience relevance — is their experience directly applicable to the role?
3. Impact evidence — can they show measurable outcomes from past work?
4. Growth trajectory — are they improving over time?
5. Culture alignment — do they demonstrate MindMate values?

Risk flags to watch for:
- Employment gaps over 12 months without explanation
- More than 2 roles under 6 months in the last 3 years
- Skills listed but no evidence of use in work experience
- Overqualified candidates applying for junior roles'
);

-- ============================================================
-- VERIFY
-- ============================================================
SELECT category, title FROM knowledge_base ORDER BY category, title;
