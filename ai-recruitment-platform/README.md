# MindMate – AI Recruitment Intelligence Platform

An AI-powered recruitment intelligence platform that automates candidate intake, resume analysis, candidate evaluation, and recruiter-ready summaries.

Built with n8n, Supabase, Groq AI, and Retrieval-Augmented Generation (RAG), MindMate transforms unstructured job applications into structured candidate insights, helping recruiters reduce manual screening time and improve evaluation consistency.

## Project Overview

MindMate automates the initial recruitment screening process by:

* Collecting candidate applications
* Parsing resumes using AI
* Retrieving role-specific hiring criteria from a knowledge base
* Evaluating candidate-job fit
* Generating recruiter-ready summaries
* Sending automated notifications
* Maintaining a complete audit trail

The platform is designed as an AI-assisted screening system. Final interviews, hiring decisions, and candidate selection remain the responsibility of recruiters and hiring managers.

## Key Features

### Candidate Intake

* Custom application form
* Resume upload and cloud storage
* Input validation and processing
* Automated application tracking

### AI Resume Parsing

Extracts structured candidate data including:

* Skills
* Work Experience
* Education
* Certifications
* Languages
* Contact Information

### Knowledge-Based Evaluation

* RAG-powered hiring criteria retrieval
* Role-specific evaluation context
* Consistent candidate assessment

### AI Screening Agent

Generates:

* Candidate Score (0–100)
* Recommendation
* Strengths
* Weaknesses
* Missing Requirements
* Recruiter Summary

### Recruiter Support

* Candidate ranking assistance
* Screening summaries
* Suggested interview topics
* Review queue management

### Automation

* Candidate notifications
* Status updates
* Error monitoring
* Activity logging

## System Architecture

```text
Candidate Application
        │
        ▼
WF1 — Candidate Submission
        │
        ▼
WF2 — Resume Parsing
        │
        ▼
WF3 — Knowledge Base Retrieval
        │
        ▼
WF4 — AI Screening Agent
        │
        ▼
WF5 — Candidate Scoring
        │
        ▼
WF6 — Recruiter Summary Generation
        │
        ▼
WF7 — Email Notifications
        │
        ▼
WF8 — Status Updates
        │
        ▼
Error Handler
```

## Technology Stack

| Layer               | Technology            |
| ------------------- | --------------------- |
| Workflow Automation | n8n                   |
| Database            | Supabase PostgreSQL   |
| Vector Search       | Supabase pgvector     |
| File Storage        | Supabase Storage      |
| AI Provider         | Groq (Llama Models)   |
| Frontend            | HTML, CSS, JavaScript |
| Email               | Gmail API             |

## Database Design

Core tables:

* companies
* recruiters
* jobs
* candidates
* applications
* documents
* scores
* knowledge_base
* agent_logs
* activities

## Workflow Overview

| Workflow      | Purpose                      |
| ------------- | ---------------------------- |
| WF1           | Candidate Submission         |
| WF2           | Resume Parsing               |
| WF3           | Knowledge Base Retrieval     |
| WF4           | AI Screening Agent           |
| WF5           | Candidate Scoring            |
| WF6           | Recruiter Summary Generation |
| WF7           | Email Notifications          |
| WF8           | Status Updates               |
| Error Handler | Failure Monitoring           |

## Problems Solved

* Manual resume screening
* Slow candidate processing
* Inconsistent candidate evaluations
* Unstructured resume data
* Lack of screening audit trails

## Impact

* Automated candidate intake and processing
* Structured resume analysis using AI
* Knowledge-based candidate evaluation
* Consistent screening methodology
* Faster recruiter review process
* End-to-end screening completed in minutes

## Future Upgrades

* Recruiter dashboard with real-time metrics
* Multi-tenant company support
* OpenAI and Gemini integration
* Advanced screening analytics
* Bias detection and compliance checks
* Calendar integration for interview scheduling
* Bulk application processing
* Enhanced candidate ranking algorithms

## Author
Patrick James Villamayor
