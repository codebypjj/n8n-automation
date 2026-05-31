# AI-Powered YouTube Shorts Automation

## Overview

An end-to-end YouTube Shorts automation workflow built with n8n that automatically generates optimized Shorts metadata using AI, sends content for manual approval via Telegram, and publishes approved videos directly to YouTube.

The workflow combines Google Drive, OpenAI, Telegram, YouTube, and Google Sheets into a streamlined content production pipeline.

## Features

* Automatic video detection from Google Drive
* AI-powered video transcription
* AI-generated titles, descriptions, hashtags, and hooks
* Telegram review and approval system
* One-click approve or reject workflow
* Automatic YouTube upload for approved content
* Rejection handling and file organization
* Google Sheets analytics and logging
* Processing time tracking

## Workflow Architecture

```text
Google Drive
      │
      ▼
File Detection
      │
      ▼
Video Download
      │
      ▼
OpenAI Transcription
      │
      ▼
OpenAI Content Generation
      │
      ▼
Telegram Review
 ┌─────────────┐
 │             │
 ▼             ▼
Approve      Reject
 │             │
 ▼             ▼
YouTube      Move File
Upload       to Rejected Folder
 │             │
 ▼             ▼
Log Data    Log Data
to Sheets   to Sheets
```

## Technologies Used

* n8n
* OpenAI API
* Google Drive API
* Telegram Bot API
* YouTube Data API
* Google Sheets API

## Automation Flow

### 1. Monitor Google Drive

The workflow watches a designated Google Drive folder for newly uploaded video files.

### 2. Video Validation

Only supported video formats are processed:

* MP4
* MOV
* MKV

### 3. AI Transcription

The uploaded video is transcribed automatically using OpenAI speech-to-text capabilities.

### 4. AI Content Optimization

OpenAI generates:

* Viral-style YouTube title
* Optimized description
* Relevant hashtags
* Hook sentence
* Hook classification

### 5. Human Approval Layer

The generated content is sent to Telegram for review.

Options:

* ✅ Approve
* ❌ Reject

### 6. Publishing Decision

#### Approved

* Video uploaded to YouTube
* Metadata applied automatically
* Entry logged in Google Sheets

#### Rejected

* File moved to a rejected folder
* Telegram notification sent
* Entry logged in Google Sheets

### 7. Analytics Logging

The workflow records:

* Video name
* Upload date
* Generated title
* Status
* Processing duration
* YouTube video ID

## Business Value

This automation reduces the manual effort required to publish YouTube Shorts while maintaining content quality through human review.

Benefits include:

* Faster content production
* Consistent metadata optimization
* Improved workflow efficiency
* Centralized content tracking
* Scalable Shorts publishing

## Setup

1. Import the workflow into n8n.
2. Connect Google Drive credentials.
3. Connect OpenAI credentials.
4. Connect Telegram Bot credentials.
5. Connect YouTube credentials.
6. Connect Google Sheets credentials.
7. Configure folder IDs and spreadsheet IDs.
8. Activate the workflow.

## Future Improvements

* Auto-generated thumbnails
* Multi-language support
* Viral score prediction
* Automatic scheduling
* AI-powered title A/B testing
* YouTube Analytics integration

## Author

Patrick James Villamayor
