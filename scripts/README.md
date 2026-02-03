# YouTube Video Fetcher

This script fetches all public videos from your YouTube channel and creates Hugo tutorial posts for each video.

## Setup

### 1. Install Dependencies

```bash
cd scripts
pip install -r requirements.txt
```

### 2. Get YouTube API Key

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project (or select existing)
3. Enable the YouTube Data API v3:
   - Go to "APIs & Services" > "Library"
   - Search for "YouTube Data API v3"
   - Click "Enable"
4. Create credentials:
   - Go to "APIs & Services" > "Credentials"
   - Click "Create Credentials" > "API Key"
   - Copy your API key

### 3. Set API Key

```bash
export YOUTUBE_API_KEY="your-api-key-here"
```

Or add it to your shell profile (~/.bashrc, ~/.zshrc):

```bash
echo 'export YOUTUBE_API_KEY="your-api-key-here"' >> ~/.zshrc
source ~/.zshrc
```

## Usage

Run the script from the project root or scripts directory:

```bash
python scripts/fetch_youtube_videos.py
```

## What It Does

1. Connects to YouTube Data API using your API key
2. Finds your channel: @LorenaPantano
3. Fetches all public videos with metadata (title, description, date, views, likes)
4. Creates a Hugo markdown post for each video in `content/tutorials/`
5. Saves video data to `scripts/youtube_videos.json` for reference

## Output

Each video creates a file: `content/tutorials/YYYY-MM-DD-video-slug.md`

Example:
```markdown
---
title: "Video Title"
date: 2024-01-15T10:30:00Z
draft: false
type: tutorial
summary: Video description...
tags:
  - tutorial
  - video
categories:
  - Tutorials

video:
  youtube: "VIDEO_ID"
  thumbnail: "thumbnail-url"

views: 1234
likes: 56
---

## Video Tutorial

{{< youtube VIDEO_ID >}}

## Description

Full video description...
```

## Notes

- The script skips existing files (won't overwrite)
- Video titles are converted to URL-friendly slugs
- All video data is saved to `youtube_videos.json` for reference
- API quota: YouTube Data API allows 10,000 units/day (each video fetch uses ~3 units)
