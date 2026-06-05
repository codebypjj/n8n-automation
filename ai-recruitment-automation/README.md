# AI Recruitment Automation Workflow

An AI-powered recruitment workflow built with **n8n** that automates candidate screening, resume analysis, qualification scoring, and applicant communication.

Designed to reduce manual hiring effort, improve screening consistency, and accelerate the recruitment process through workflow automation and AI-driven evaluation.

---

## Overview

Recruiters often spend hours manually reviewing resumes, identifying qualified candidates, managing applicant records, and sending repetitive emails.

This workflow automates the entire initial screening process, from application submission to candidate qualification and recruiter notification.

The system:

* Accepts candidate applications through an online form
* Stores resumes in Google Drive
* Detects duplicate applications
* Extracts text from PDF resumes
* Uses AI to evaluate candidate qualifications
* Generates qualification scores
* Stores applicant data in Airtable
* Notifies recruiters of qualified candidates
* Sends automated interview invitations
* Sends rejection emails when requirements are not met

---

## Key Features

### Application Submission Portal

Applicants submit:

* Full Name
* Email Address
* Phone Number
* Position Applied For
* Resume (PDF)

### Automated Resume Storage

All submitted resumes are automatically stored in Google Drive for centralized document management and future reference.

### Duplicate Application Detection

Before processing a candidate, the workflow checks Airtable for previous applications.

Benefits:

* Prevents duplicate records
* Reduces recruiter workload
* Maintains clean applicant databases

### Resume Parsing

The workflow extracts text from uploaded PDF resumes and prepares the content for AI analysis.

### AI-Powered Resume Analysis

Using Llama 3.3 70B via Groq API, the workflow evaluates:

* Professional experience
* Technical skills
* Strengths
* Overall candidate suitability

The AI returns structured JSON data for downstream processing.

### Candidate Qualification Scoring

Each candidate receives:

* Qualification Score (0–100)
* Match Classification

  * Strong Match
  * Potential Match
  * Weak Match
* Priority Ranking

### Airtable Candidate Database

The workflow automatically stores:

* Applicant Information
* Resume Analysis Results
* Skills
* Evaluation Summary
* Qualification Scores
* Review Status

### Automated Communication

#### Qualified Candidates

* Recruiter receives notification
* Candidate receives interview invitation

#### Non-Qualified Candidates

* Candidate receives rejection email

#### Duplicate Applications

* Candidate receives duplicate application notification

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
 ┌──────┴──────┐
 │             │
 ▼             ▼
Duplicate    Continue
Notice         │
               ▼
      Resume Extraction
               │
               ▼
      Candidate Record
               │
               ▼
       AI Analysis
               │
               ▼
      Qualification Score
               │
               ▼
     Save to Airtable
               │
               ▼
      Candidate Decision
               │
      ┌────────┴────────┐
      │                 │
      ▼                 ▼
Qualified         Not Qualified
      │                 │
      ▼                 ▼
Recruiter Alert   Rejection Email
      │
      ▼
Interview Invitation
```

---

## Technology Stack

### Automation

* n8n

### AI

* Groq API
* Llama 3.3 70B

### Database

* Airtable

### Storage

* Google Drive

### Communication

* Gmail

### Document Processing

* PDF Resume Extraction

---

## Business Impact

This workflow helps organizations:

* Reduce manual resume screening
* Improve hiring consistency
* Accelerate candidate evaluation
* Maintain organized applicant records
* Automate recruiter communication
* Improve recruitment scalability

---

## Screenshots

### Workflow Overview

`/screenshots/workflow-overview.png`

### Airtable Candidate Dashboard

`/screenshots/airtable-dashboard.png`

### Automated Email Notifications

`/screenshots/email-samples.png`

---

## Setup

1. Import the workflow into n8n
2. Configure Airtable credentials
3. Configure Google Drive credentials
4. Configure Gmail credentials
5. Configure Groq API credentials
6. Create the Airtable database structure
7. Publish the application form
8. Run end-to-end testing

---

## Future Enhancements

### Recruiter Approval Workflow

Introduce a human-in-the-loop approval process before sending interview invitations.

Benefits:

* Human validation
* Reduced false positives
* Better hiring decisions

---

### Multi-Stage Candidate Tracking

Track applicants throughout the recruitment lifecycle:

* Applied
* Under Review
* Qualified
* Interview Scheduled
* Interview Completed
* Hired
* Rejected

---

### Recruiter Dashboard

Generate recruiter-friendly summaries such as:

```text
Candidate: John Doe
Position: Software Engineer
Score: 87/100
Skills: JavaScript, React, SQL
Recommendation: Interview
```

---

### Audit Logging

Create a complete activity trail containing:

* Timestamp
* Candidate
* Action
* Status
* User

Useful for compliance, reporting, and process visibility.

---

### Error Handling & Recovery

Implement dedicated error-handling workflows using n8n Error Triggers.

Features:

* Capture failed executions
* Log errors to Airtable
* Notify administrators
* Retry failed operations automatically
* Monitor workflow reliability

---

### Candidate Ranking Sub-Workflow

Build a separate ranking workflow that:

* Fetches all reviewed candidates
* Sorts candidates by qualification score
* Assigns rankings automatically
* Updates Airtable records
* Highlights top applicants

---

### Dashboard Integration

Integrate with:

* Airtable Interfaces
* Retool
* Appsmith

Features:

* Real-time recruitment metrics
* Candidate statistics
* Hiring pipeline visualization

Webhook triggers can automatically update dashboards whenever a candidate is reviewed.

---

### Bulk Resume Processing

Enable recruiters to upload ZIP files containing multiple resumes.

Features:

* Bulk PDF extraction
* Parallel AI analysis
* Batch candidate creation
* Bulk qualification scoring

Ideal for high-volume recruitment campaigns.

---

### Telegram Recruiter Notifications

Send real-time Telegram alerts when qualified candidates are identified.

---

### Calendar Integration

Automatically schedule interviews using:

* Google Calendar
* Microsoft Outlook

---

### ATS Integration

Connect with Applicant Tracking Systems (ATS) for enterprise-grade recruitment workflows.

---

## Security Notes

Before publishing the workflow publicly:

* Remove API keys
* Remove access tokens
* Remove OAuth credentials
* Remove webhook IDs
* Remove personal email addresses

Replace all sensitive values with placeholders before committing to GitHub.

---

## Author

Patrick James Villamayor
