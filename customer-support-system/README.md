# Customer Support Automation

An AI-powered customer support automation workflow built with **n8n**, **Google Gemini**, **Gmail**, **Airtable**, **Slack**, and **Google Docs**.

This workflow automatically monitors incoming customer emails, classifies support requests using AI, generates multilingual replies, creates support tickets, and routes high-priority issues for human approval.

---

## Features

* Monitors Gmail inbox for new customer inquiries
* Uses Google Gemini to analyze customer emails
* Automatically detects the customer's language
* Generates professional replies in the customer's language
* Classifies ticket priority (High, Medium, Low)
* Answers only using a Google Docs knowledge base
* Creates support tickets in Airtable
* Sends Slack notifications for high-priority issues
* Includes a human approval workflow before sending critical responses
* Automatically replies to low and medium priority emails

---

## Tech Stack

* n8n
* Google Gemini
* Gmail API
* Airtable
* Google Docs
* Slack

---

## Workflow

```text
Customer Email
      │
      ▼
 Gmail Trigger
      │
      ▼
 Extract Customer Details
      │
      ▼
 Google Gemini AI
      │
      ├── Detect Language
      ├── Classify Priority
      ├── Generate Reply
      └── Summarize Issue
      │
      ▼
 Create Airtable Ticket
      │
      ▼
 Priority Check
      │
      ├── High
      │      │
      │      ▼
      │ Slack Notification
      │      │
      │ Human Review Form
      │      │
      │ Send Approved Reply
      │
      └── Medium / Low
             │
             ▼
      Auto Send Reply
```

---

## AI Capabilities

The AI agent is responsible for:

* Detecting the customer's language
* Classifying ticket priority
* Summarizing customer issues
* Generating multilingual responses
* Following a predefined business knowledge base
* Producing structured JSON outputs for downstream automation

---

## Future Improvements

* CRM integration
* Customer sentiment analysis
* Ticket assignment automation
* Analytics dashboard
* Retrieval-Augmented Generation (RAG) knowledge base
* Voice support
* Multi-channel support (Messenger, WhatsApp, Telegram)

---

## Author
Patrick James Villamayor
