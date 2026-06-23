# AI-Powered Quotation Automation System

A no-code quotation automation workflow built with n8n that automatically generates and sends a professional quotation email the moment a customer submits a project inquiry — no manual work required.

---

## Features

- AI-powered quotation generation using Groq (LLaMA 3)
- Automated customer inquiry intake via Google Forms
- Dynamic AI analysis — pricing, timeline, deliverables, and complexity
- Automatic CRM logging in Google Sheets
- Professional quotation email sent automatically via Gmail
- Real-time Telegram notification for the business owner
- Input validation before processing
- Simple business landing page with a "Get a Free Quotation" button

---

## Workflow

1. Customer visits the landing page and clicks **"Get a Free Quotation"**
2. Redirected to a Google Form to submit their project inquiry
3. n8n detects the new submission via Google Sheets Trigger
4. Input is validated — incomplete submissions are caught and logged
5. AI Agent reads the business knowledge base (Google Docs)
6. AI generates a project summary, pricing estimate, timeline, and quotation draft
7. Lead is logged automatically in the Google Sheets CRM
8. Quotation email is sent to the customer via Gmail
9. Business owner receives a Telegram notification

---

## Technologies Used

| Technology | Purpose |
|---|---|
| n8n | Workflow Automation |
| Google Forms | Customer Inquiry Intake |
| Google Sheets | CRM & Data Storage |
| Google Docs | AI Knowledge Base |
| Gmail API | Email Automation |
| Groq (LLaMA 3) | AI Processing |
| Telegram | Business Owner Notifications |
| HTML / CSS / JS | Landing Page |

---

## AI Processing

The AI Agent reads the business knowledge base and analyzes each inquiry to generate:

- Project summary
- Complexity assessment (Low / Medium / High)
- Estimated price range
- Estimated project timeline
- Recommended deliverables
- Missing information detection
- Full professional quotation draft

---

## Setup

### 1. Import the Workflow
Import `workflow.json` into your n8n instance.

### 2. Configure Credentials
Set up the following credentials in n8n:
- Google Sheets OAuth2
- Google Docs OAuth2
- Gmail OAuth2
- Groq API Key
- Telegram Bot Token

### 3. Update Configuration
Replace the following with your own values:
- Google Sheets — Spreadsheet ID and Sheet Name
- Google Docs — Knowledge Base Document ID
- Gmail — Sender address
- Telegram — Chat ID
- Landing page — Google Form URL (appears 3 times in `index.html`)

### 4. Set Up the Knowledge Base
Create a Google Doc with your business information:
- Services and pricing
- FAQs
- Payment terms
- Terms and conditions

### 5. Test the Workflow
Submit a sample inquiry through the Google Form and verify:
- Data is stored in Google Sheets CRM
- AI generates a quotation draft
- Quotation email is received by the customer
- Telegram notification is sent to the business owner

---

## Use Cases

Reusable for any service-based business:

`Freelancers` · `Marketing Agencies` · `Printing Shops` · `IT Services` · `Consultants` · `Contractors` · `Repair Services` · `Small Businesses`

---

## Future Improvements

- [ ] PDF quotation generation and email attachment
- [ ] Error workflow for production monitoring
- [ ] Customer follow-up automation
- [ ] Returning customer detection
- [ ] Analytics dashboard
- [ ] Status update automation

---

## Author
Patrick James Villamayor
