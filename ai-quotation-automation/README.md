# AI-Powered Quotation Automation System

A no-code quotation automation workflow built with n8n that automatically generates a professional quotation email from customer requests and sends it directly to the client.

This project demonstrates how businesses can automate repetitive quotation processes using workflow automation instead of manually composing emails.

## Features

- Automated quotation email generation
- Dynamic customer information
- Google Sheets integration
- Gmail integration
- Customizable email template
- Fully automated workflow

## Workflow

1. Customer submits a quotation request.
2. Request data is stored in Google Sheets.
3. n8n retrieves the customer information.
4. A quotation email is generated dynamically.
5. The quotation is automatically sent to the customer's email.

## Technologies Used

- n8n
- Google Sheets API
- Gmail API


## Setup

### 1. Import the Workflow

Import the provided `workflow.json` into your n8n instance.

### 2. Configure Credentials

Replace the following with your own credentials:

- Google Sheets OAuth2
- Gmail OAuth2

### 3. Update Configuration

Replace the following values:

- Spreadsheet ID
- Sheet Name
- Gmail Sender Address

### 4. Test

Run the workflow using sample customer information and verify that:

- Data is stored in Google Sheets.
- A quotation email is generated.
- The email is successfully delivered to the customer.

## Use Cases

- Freelancers
- Agencies
- IT Services
- Marketing Agencies
- Printing Services
- Small Businesses

## Author
Patrick James Villamayor
