# Setup Guide

## Prerequisites

Before importing the workflow, make sure you have:

- n8n installed and running
- A Google account
- A Gmail account
- A Groq API key
- A Telegram Bot (optional for notifications)

---

## Step 1: Import the Workflow

1. Download the workflow JSON file.
2. Open n8n.
3. Click **Import Workflow**.
4. Select the JSON file.
5. Save the workflow.

---

## Step 2: Configure Credentials

### Google Sheets

Create a Google Sheets credential and connect your Google account.

Required permissions:

- Read spreadsheets
- Update spreadsheets

### Gmail

Create a Gmail credential and connect your Gmail account.

Required permissions:

- Send emails

### Groq

Create a Groq credential using your API key.

Required:

```text
GROQ_API_KEY
```

### Telegram (Optional)

Create a Telegram Bot using BotFather and connect it to n8n.

---

## Step 3: Create a Spreadsheet

Create a Google Sheet and add the required columns.

Example:

| Name | Email | Phone | Project Type | Dimensions | Notes |
|--------|--------|--------|--------|--------|--------|

Copy the spreadsheet ID.

---

## Step 4: Update Workflow Variables

Replace the placeholder values:

```text
YOUR_GOOGLE_SHEET_ID
YOUR_GMAIL_CREDENTIAL_ID
YOUR_GROQ_CREDENTIAL_ID
YOUR_TELEGRAM_CHAT_ID
```

---

## Step 5: Test the Workflow

1. Add a test inquiry to the spreadsheet.
2. Execute the workflow manually.
3. Verify:
   - AI analysis is generated
   - Cost estimation is calculated
   - Email quotation is sent
   - Google Sheet is updated

---

## Step 6: Activate the Workflow

After successful testing:

1. Click **Activate**.
2. Monitor the first few executions.
3. Verify quotations are generated correctly.

---

## Troubleshooting

### Gmail Not Sending

- Check Gmail credentials
- Verify Gmail permissions
- Reconnect the Gmail account

### Google Sheets Errors

- Verify spreadsheet ID
- Check spreadsheet permissions
- Confirm column names match the workflow

### AI Generation Errors

- Verify Groq API credentials
- Check API quota limits
- Confirm the selected model is available

---

## Security Notes

Before sharing this workflow:

- Remove credential IDs
- Replace spreadsheet IDs with placeholders
- Remove personal email addresses
- Replace webhook IDs
- Replace Telegram chat IDs

Never commit API keys or OAuth tokens to GitHub.
