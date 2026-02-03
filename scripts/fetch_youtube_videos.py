#!/usr/bin/env python3
"""
Fetch all videos from a YouTube channel and create Hugo tutorial posts.

Requirements:
    pip install google-api-python-client python-dateutil

Usage:
    1. Get a YouTube Data API key from: https://console.cloud.google.com/apis/credentials
    2. Set your API key: export YOUTUBE_API_KEY="your-api-key"
    3. Run: python fetch_youtube_videos.py
"""

import os
import sys
import json
from datetime import datetime
from pathlib import Path

try:
    from googleapiclient.discovery import build
    from dateutil import parser as date_parser
    from dotenv import load_dotenv
except ImportError:
    print("Error: Required packages not installed.")
    print("Install with: pixi install")
    sys.exit(1)

# Load environment variables from .env file
env_path = Path(__file__).parent.parent / ".env"
load_dotenv(env_path)

# Configuration
CHANNEL_USERNAME = "LorenaPantano"
CONTENT_DIR = Path(__file__).parent.parent / "content" / "tutorials"
API_KEY = os.environ.get("YOUTUBE_API_KEY")

if not API_KEY:
    print("Error: YOUTUBE_API_KEY not found in .env file.")
    print("Add it to .env: export YOUTUBE_API_KEY='your-api-key'")
    sys.exit(1)


def get_channel_id(youtube, username):
    """Get channel ID from username."""
    request = youtube.channels().list(
        part="id",
        forUsername=username
    )
    response = request.execute()

    if not response.get("items"):
        # Try with custom URL
        request = youtube.search().list(
            part="snippet",
            q=username,
            type="channel",
            maxResults=1
        )
        response = request.execute()
        if response.get("items"):
            return response["items"][0]["snippet"]["channelId"]
        return None

    return response["items"][0]["id"]


def get_uploads_playlist_id(youtube, channel_id):
    """Get the uploads playlist ID for a channel."""
    request = youtube.channels().list(
        part="contentDetails",
        id=channel_id
    )
    response = request.execute()

    return response["items"][0]["contentDetails"]["relatedPlaylists"]["uploads"]


def get_all_videos(youtube, playlist_id):
    """Fetch all videos from a playlist."""
    videos = []
    next_page_token = None

    while True:
        request = youtube.playlistItems().list(
            part="snippet,contentDetails",
            playlistId=playlist_id,
            maxResults=50,
            pageToken=next_page_token
        )
        response = request.execute()

        for item in response["items"]:
            video_id = item["contentDetails"]["videoId"]
            snippet = item["snippet"]

            # Get additional video details
            video_request = youtube.videos().list(
                part="snippet,contentDetails,statistics",
                id=video_id
            )
            video_response = video_request.execute()

            if video_response["items"]:
                video_data = video_response["items"][0]
                videos.append({
                    "id": video_id,
                    "title": snippet["title"],
                    "description": snippet["description"],
                    "published_at": snippet["publishedAt"],
                    "thumbnail": snippet["thumbnails"]["high"]["url"],
                    "duration": video_data["contentDetails"]["duration"],
                    "view_count": video_data["statistics"].get("viewCount", "0"),
                    "like_count": video_data["statistics"].get("likeCount", "0"),
                })

        next_page_token = response.get("nextPageToken")
        if not next_page_token:
            break

    return videos


def create_slug(title):
    """Create a URL-friendly slug from title."""
    import re
    slug = title.lower()
    slug = re.sub(r'[^a-z0-9\s-]', '', slug)
    slug = re.sub(r'[\s-]+', '-', slug)
    return slug.strip('-')


def create_tutorial_post(video):
    """Create a Hugo markdown post for a video."""
    published_date = date_parser.parse(video["published_at"])
    date_str = published_date.strftime("%Y-%m-%d")
    slug = create_slug(video["title"])

    # Create filename: date-slug.md
    filename = f"{date_str}-{slug}.md"
    filepath = CONTENT_DIR / filename

    # Clean up description for YAML summary (single line, no special chars)
    description = video['description'].replace('\n', ' ').replace('\r', ' ')
    # Remove multiple spaces
    description = ' '.join(description.split())
    # Truncate and add ellipsis
    summary = description[:200] + '...' if len(description) > 200 else description

    # Escape double quotes in title and summary for YAML
    title = video['title'].replace('"', '\\"')
    summary_escaped = summary.replace('"', '\\"')

    # Hugo frontmatter
    frontmatter = f"""---
title: "{title}"
date: {published_date.isoformat()}
draft: false
type: tutorial
summary: "{summary_escaped}"
tags:
  - tutorial
  - video
categories:
  - Tutorials

# YouTube video
video:
  youtube: "{video['id']}"
  thumbnail: "{video['thumbnail']}"

# Metadata
views: {video['view_count']}
likes: {video['like_count']}
---

## Video Tutorial

{{{{< youtube {video['id']} >}}}}

## Description

{video['description']}

## Watch on YouTube

[View on YouTube](https://www.youtube.com/watch?v={video['id']})
"""

    return filepath, frontmatter


def main():
    """Main function to fetch videos and create posts."""
    print(f"Fetching videos from channel: @{CHANNEL_USERNAME}")

    # Initialize YouTube API
    youtube = build("youtube", "v3", developerKey=API_KEY)

    # Get channel ID
    print("Getting channel ID...")
    channel_id = get_channel_id(youtube, CHANNEL_USERNAME)
    if not channel_id:
        print(f"Error: Could not find channel @{CHANNEL_USERNAME}")
        sys.exit(1)

    print(f"Channel ID: {channel_id}")

    # Get uploads playlist
    print("Getting uploads playlist...")
    playlist_id = get_uploads_playlist_id(youtube, channel_id)
    print(f"Uploads playlist ID: {playlist_id}")

    # Fetch all videos
    print("Fetching all videos...")
    videos = get_all_videos(youtube, playlist_id)
    print(f"Found {len(videos)} videos")

    # Create tutorial posts
    print(f"\nCreating tutorial posts in {CONTENT_DIR}...")
    CONTENT_DIR.mkdir(parents=True, exist_ok=True)

    created_files = []
    for video in videos:
        filepath, content = create_tutorial_post(video)

        if filepath.exists():
            print(f"  ⚠️  Skipping (exists): {filepath.name}")
        else:
            with open(filepath, "w", encoding="utf-8") as f:
                f.write(content)
            print(f"  ✓ Created: {filepath.name}")
            created_files.append(filepath.name)

    print(f"\n✅ Done! Created {len(created_files)} new tutorial posts.")

    # Save video data as JSON for reference
    json_path = Path(__file__).parent / "youtube_videos.json"
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(videos, f, indent=2, ensure_ascii=False)
    print(f"📄 Video data saved to: {json_path}")


if __name__ == "__main__":
    main()
