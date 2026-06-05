# AI Recruitment Automation Workflow

An AI-powered recruitment system built with **n8n** that automates candidate screening, resume analysis, scoring, and applicant communication.

This workflow reduces manual hiring effort, improves screening consistency, and speeds up recruitment through AI-driven evaluation and automation.

---

## Overview

Recruitment teams often spend significant time manually reviewing resumes, identifying qualified candidates, and sending repetitive communications.

This workflow automates the entire initial hiring pipeline — from application submission to candidate decision-making and recruiter notification.

### What it does

- Accepts candidate applications via form  
- Stores resumes in Google Drive  
- Detects duplicate applications  
- Extracts and processes resume text (PDF)  
- Uses AI to evaluate candidate suitability  
- Generates qualification scores  
- Stores structured data in Airtable  
- Sends recruiter notifications  
- Sends automated interview invitations  
- Sends rejection emails for non-qualified applicants  

---

## Key Features

### Application Intake System

Applicants submit:

- Full Name  
- Email Address  
- Phone Number  
- Position Applied For  
- Resume (PDF)  

---

### Automated Resume Storage

All uploaded resumes are automatically stored in Google Drive for centralized access and record keeping.

---

### Duplicate Application Detection

Before processing, the system checks Airtable for existing applications.

**Benefits:**

- Prevents duplicate entries  
- Keeps database clean  
- Reduces unnecessary processing  

---

### Resume Parsing Engine

Extracts structured text from PDF resumes and prepares it for AI evaluation.

---

### AI Resume Evaluation

Uses **Llama 3.3 70B via Groq API** to analyze candidates based on:

- Work experience  
- Technical skills  
- Strengths  
- Overall job fit  

The AI returns structured JSON output for workflow processing.

---

### Candidate Scoring System

Each applicant is assigned:

- Score (0–100)  
- Match Level:
  - Strong Match  
  - Potential Match  
  - Weak Match  
- Priority Ranking  

---

### Airtable Candidate Database

Stores all applicant data including:

- Personal information  
- Resume analysis results  
- Skills extracted  
- AI evaluation summary  
- Scores and rankings  
- Application status  

---

### Automated Communication System

#### For Qualified Candidates

- Recruiter notification sent  
- Interview invitation emailed to candidate  

#### For Non-Qualified Candidates

- Automated rejection email sent  

#### For Duplicate Applications

- Duplicate application notification sent  

---

## Workflow Architecture

```text
Application Form
        │
        ▼
Resume Upload
        │
        ▼
Google Drive Storage
        │
        ▼
Duplicate Check
        │
        ▼
Resume Extraction
        │
        ▼
AI Analysis (Groq Llama 3.3 70B)
        │
        ▼
Scoring & Classification
        │
        ▼
Airtable Storage
        │
        ▼
Decision Engine
        │
   ┌────┴────┐
   ▼         ▼
Qualified   Rejected
   │         │
   ▼         ▼
Recruiter   Rejection Email
Notification
   │
   ▼
Interview Invitation

