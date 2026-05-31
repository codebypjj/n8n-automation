# AI-Powered Signage Quotation Automation

## Overview

An end-to-end business automation workflow built with n8n that automatically processes signage inquiries, calculates project costs, generates professional quotations using AI, and delivers them to customers via email.

This workflow helps signage businesses reduce manual quotation work, improve response times, and maintain consistent pricing.

---

## Features

- Automated lead capture from Google Forms
- Customer inquiry processing
- AI-powered project analysis
- Automated material cost estimation
- Labor and installation cost calculation
- Delivery fee estimation
- AI-generated professional quotations
- Gmail email delivery
- Google Sheets record management
- Quote status tracking

---

## Workflow Architecture

```text
Google Form
     │
     ▼
Google Sheets
     │
     ▼
Customer Inquiry Processing
     │
     ▼
AI Project Analysis
     │
     ▼
Cost Estimation Engine
     │
     ▼
AI Quote Generation
     │
     ▼
Gmail Delivery
     │
     ▼
Update Google Sheets
```

---

## Technologies Used

- n8n
- Groq AI (Llama 3.3 70B)
- Google Sheets API
- Gmail API
- JavaScript
- AI Prompt Engineering

---

## Automation Flow

### 1. Lead Collection

Customer inquiries are collected through Google Forms and stored in Google Sheets.

### 2. Project Analysis

AI analyzes the project requirements including:

- Sign type
- Dimensions
- Materials
- Complexity
- Installation requirements

### 3. Cost Calculation

The workflow estimates:

- Material cost
- Labor cost
- Installation cost
- Delivery cost
- Total project cost

### 4. Quote Generation

AI generates a professional quotation email including:

- Project summary
- Estimated pricing
- Service details
- Call-to-action

### 5. Email Delivery

The quotation is automatically sent to the customer via Gmail.

### 6. Record Management

The workflow updates Google Sheets with:

- Customer information
- Generated quotation
- Estimated cost
- Quote status
- Processing date

---

## Business Benefits

- Faster quote turnaround
- Reduced manual work
- Consistent pricing process
- Improved customer response time
- Scalable quotation workflow
- Better lead management

---

## Setup

1. Import the workflow into n8n.
2. Configure Google Sheets credentials.
3. Configure Gmail credentials.
4. Configure Groq API credentials.
5. Update spreadsheet IDs.
6. Update email settings.
7. Activate the workflow.

---

## Future Improvements

- PDF quotation generation
- CRM integration
- Digital signature support
- Follow-up automation
- Approval workflows
- Customer portal integration

---

## Author

Patrick James Villamayor
