# Content Package: "Sharing Genomics Data Across Collaborators Without a Dev Team"

## Overview

This package contains a complete, technically accurate blog post and video script about building collaborative genomics research infrastructure using IGV, Python automation, GitHub Actions, and AWS. Content is based on the live production system at https://github.com/hbc/app-igv-skinpo1.

## Files Included

### 1. **post.md** (1,600+ words)
The main blog post for publication. Includes:
- Hook and problem statement
- Three-part solution (IGV + standardization + automation)
- Detailed technical implementation
- Architecture explanation
- Why this approach works
- Key lessons and GitHub link

**Status:** ✅ Complete - Ready for design/publication

### 2. **video-script.md** (6-7 minute script)
Structured video script with:
- Clear section markers and timing
- Visual direction for each segment
- Technical explanations in accessible language
- Production notes and asset requirements
- Callout sections for color-coding explanation

**Status:** ✅ Complete - Ready for videographer/narrator

### 3. **social-instagram.txt**
- 62 characters (well under 125-char limit)
- Casual, technical hook
- 1 emoji (DNA 🧬)
- 7 hashtags (reduce to 3-5 for final version)

**Status:** ✅ Complete - Ready to post

### 4. **social-linkedin.txt**
- 228 characters (fits LinkedIn 280-char window)
- Professional tone
- Problem → insight → value structure
- Same post used for LinkedIn, Bluesky, Mastodon
- 5 hashtags

**Status:** ✅ Complete - Ready to post

### 5. **metadata.md**
Contains:
- SEO keywords and meta descriptions
- Platform-specific social media details
- Video production notes with key visuals
- Related topics for cross-linking
- Source citations
- Design asset checklist

**Status:** ✅ Complete - Reference for designers/SEO

### 6. **CORRECTIONS.md**
Documents all corrections made to the original voice memo based on repository code review. Includes:
- 10 major corrections/clarifications
- Technical accuracy verification
- Source citations to GitHub files
- Notes for future updates

**Status:** ✅ Reference document

### 7. **README.md** (this file)
Quick reference and status document.

## Key Technical Corrections Made

The voice memo contained the right conceptual understanding but lacked technical precision. This version corrects:

1. **Color coding**: Red/Blue/Orange/Gray (not Green/Red)
2. **Authentication**: Lambda@Edge at CloudFront (not separate Lambda)
3. **Infrastructure**: S3 + CloudFront + Lambda@Edge + OAC (not just S3 + Lambda)
4. **Automation**: `automate_igv_tracks.py` does recursive scanning, format detection, skip-already-converted logic
5. **Cross-species**: Maps mouse→human orthologs with species detection
6. **GitHub Actions**: Uses OIDC (no long-lived credentials), S3fs-fuse mounting, targeted invalidation

All corrections are cited back to the official repository documentation.

## Content Audience

**Target:** Data at Scale newsletter (scientists and bioinformaticians)

**Tone:** Professional, practical, no hype—focuses on resourcefulness and pragmatic engineering

## Visual Assets Needed

- [ ] Blog post hero image or featured image
- [ ] Quote card with key insight (recommend: "Composition beats custom code")
- [ ] Video thumbnail
- [ ] System architecture diagram (S3 → CloudFront → Lambda@Edge → IGV)
- [ ] BED file color-coding legend (red/blue/orange/gray)
- [ ] DESeq2 CSV → BED conversion example
- [ ] GitHub Action workflow diagram

## Production Timeline

- **Blog post:** Ready to publish immediately
- **Social media:** Ready to post immediately
- **Video:** Ready for production (script complete, awaiting narrator/videographer)
- **Design assets:** Can be created in parallel

## Key Messages

1. **Primary:** Composition (IGV) + Standardization (BED format) + Automation (GitHub Actions) = powerful research infrastructure without hiring developers

2. **Secondary:** You can build sophisticated tools by choosing existing software that solves 80% of your problem and automating the 20% it doesn't

3. **Value proposition:** Scales with collaborators, maintainable by grad students, keeps researchers focused on science

## Project Information

- **Repository:** https://github.com/hbc/app-igv-skinpo1
- **Production URL:** https://d3vmnhp176lfr2.cloudfront.net/ (password protected)
- **Project Status:** Active, used by Harvard Bioinformatics Core
- **Data:** Three projects (reprogramming, epigenetics, ABCB5) with multiple experiments each
- **Data Types:** ATAC-seq, RNA-seq, DESeq2 results, single-cell RNA

## Notes for Designers/Videographers

- Avoid exaggerating technical complexity—this is elegant simplicity
- Show the searchable experiment table UI (not just track menu)
- Highlight the four-color significance coding as visual language
- Demonstrate cross-species comparison (mouse gene → human ortholog)
- Show GitHub Action workflow as "set and forget" concept
- Emphasize that no custom code is written by the research team

## SEO and Cross-Linking

**Primary keyword:** Collaborative genomics data sharing
**Secondary keywords:** Genome browser automation, research infrastructure, continuous deployment

**Related topics for future posts:**
- Automation in research workflows
- Cloud infrastructure for science
- GitHub Actions best practices
- IGV integration tutorials
- Genomics data management

---

**Last updated:** 2026-02-04
**Content status:** Ready for design and publication
**Technical accuracy:** Verified against https://github.com/hbc/app-igv-skinpo1 source
