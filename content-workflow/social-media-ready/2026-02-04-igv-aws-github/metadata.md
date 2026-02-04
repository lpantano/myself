# Content Metadata

## Post Information
- **Title:** Sharing Genomics Data Across Collaborators Without a Dev Team
- **Slug:** sharing-genomics-data-collaborators
- **Publication Date:** TBD
- **Audience:** Data at Scale (scientists and bioinformaticians)
- **Content Type:** Technical case study / Tutorial
- **Duration (video):** 6-7 minutes

## SEO Information
- **Primary Keyword:** collaborative genomics data sharing
- **Secondary Keywords:** genome browser automation, research infrastructure, continuous deployment
- **Meta Title:** Sharing Genomics Data Across Collaborators Without a Dev Team (59 chars)
- **Meta Description:** How to build collaborative research infrastructure using IGV, format conversion, and GitHub Actions automation—without a dedicated development team. (151 chars)
- **URL Slug:** sharing-genomics-data-collaborators

## Social Media

### Instagram
- **Character Count:** 62 (well under 125-character limit)
- **Emojis:** 1 (🧬 DNA helix)
- **Hashtags:** 7 (may be reduced to 3-5 for final version)
- **Call-to-action:** "Link in bio"
- **Tone:** Casual, technical hook

### LinkedIn/Bluesky/Mastodon
- **Character Count:** 228 (within 280-character limit)
- **Emojis:** 0 (professional tone)
- **Hashtags:** 5 (professional and topic-focused)
- **Call-to-action:** "Read the full case study"
- **Tone:** Professional, insight-focused, problem → solution → value

## Content Assets Needed
- [ ] Blog post (markdown) ✓
- [ ] Video script (markdown) ✓
- [ ] Instagram social post (text) ✓
- [ ] LinkedIn/Bluesky/Mastodon post (text) ✓
- [ ] Quote card image (design needed)
- [ ] Video thumbnail (design needed)
- [ ] Hero image / featured image (design needed)

## Key Insights for Quote Card
1. "Composition beats custom code when resources are limited"
2. "Automate the 20% existing tools don't handle"
3. "Collaboration scales without hiring more people"

## Video Production Notes
- Format: Tutorial/case study walkthrough
- Pacing: Problem (1:30) → Approach (1:00) → Deep Dive (2:00) → Why It Works (1:00) → Closing (1:00)
- Key visual elements:
  - System diagram (S3 → CloudFront → Lambda@Edge auth → IGV browser)
  - IGV interface demo with three project menus
  - BED file color coding (red=up, blue=down, orange=borderline, gray=not significant)
  - DESeq2 CSV → BED conversion pipeline
  - GitHub Action workflow (daily/on-demand trigger)
  - Cross-species coordinate translation example
- Code repository: https://github.com/hbc/app-igv-skinpo1
- Key scripts to highlight:
  - `automate_igv_tracks.py` (recursive auto-scan and project registry generation)
  - `create_igv_bed.py` (DESeq2→BED with color-coded significance)

## Related Topics for Cross-linking
- Automation in research workflows
- Genomics data management
- Cloud infrastructure for science
- GitHub Actions best practices
- IGV integration tutorials

## Sources Referenced
- IGV (Integrative Genomics Viewer): https://igv.org/
- GitHub project: https://github.com/hbc/app-igv-skinpo1
