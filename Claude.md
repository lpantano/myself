Project constitution. Rules for content and code.

# For content creation

Analysis: use `content-workflow/analysis/` folder. Find data source. R for plots. `ggprism` and `grafify` for colors.

Two distribution types: video tutorials, regular posts.

Two content audiences:

## FOR GENERAL PUBLIC:

Title: "The Data in Your Life"
Description:
Data shapes your world — health apps, news studies, behavioral prediction. Can you spot when numbers lie? Newsletter breaks down real-world data, teaches manipulation spotting, conclusion questioning, evidence-based decisions. No stats degree needed — just curiosity.

## FOR SCIENTISTS:

Title: "Data at Scale" (or "Accelerating Discovery")
Description:
You know analysis. But efficient? Newsletter for researchers building better pipelines, breaking silos, leveraging AI to accelerate discovery. Technical strategies, case studies, collaborative frameworks. Less infrastructure wrestling, more finding what matters.

## Tone

### For General Public ("The Data in Your Life")
- **Curious and investigative**: "let's figure this out together"
- Lead with intrigue questions
- Reveal insights gradually, feel like discovery
- Real-world daily examples
- Simple vocab, not condescending
- No jargon; explain technical terms immediately
- Short sentences and paragraphs (2-3 max)

### For Scientists ("Data at Scale")
- **Peer-to-peer practical**: share what actually works
- Technical but accessible — assume knowledge, not tool familiarity
- Acknowledge trade-offs openly
- Implementation details that matter
- Commands, code, real workflows
- Mention time savings when relevant
- Don't oversell — honest about what works

### Universal Tone Guidelines
- **Concise**: minimum words per concept
- **Amicable and encouraging**: empowered, not inadequate
- **Direct**: no buzzwords or hype
- **Non-confrontational**: no fights, no shaming
- **Evidence-focused**: back claims with sources

## Core Values

All content must embody:

### 1. Transparency and Honesty
- Always cite sources (URLs or DOIs)
- Show limitations of data, methods, conclusions
- Uncertain or speculative → say so explicitly
- Never hide complexity that matters

### 2. Evidence-Based
- Claims need scientific paper — no social media sources
- Link to DOIs or authoritative sources
- No scientific evidence → cannot use claim
- Distinguish established from emerging findings

### 3. Accessibility
- Break down barriers
- Remove gatekeeping language
- Meet readers where they are
- Complex topics learnable by anyone curious

## Title

Short. Creates curiosity. No marketing words. Direct. No misleading.

## Content Creation Process

**ALWAYS use full workflow per post:**

1. Draft in `content-workflow/brainstorming/YYYY-MM-DD-slug/`
2. Generate 3 validation questions
3. Answer each independently
4. Refine and create final content
5. Move to `content-workflow/social-media-ready/YYYY-MM-DD-slug/`
6. Create social posts and describe visual assets
7. Copy to `content/post/` only when publish-ready

(Validation questions internal only — not in published content.)

# Social Media Guidelines

Per content piece:
- One Instagram post (general public)
- One post for LinkedIn, Bluesky, Mastodon (same version all three)

## Platform-Specific Approach

### Instagram (General Public)
- **Length**: Under 125 characters
- **Tone**: Casual, storytelling, relatable
- **Hook**: Curiosity or surprising fact
- **Format**: Question or intrigue statement
- **Call-to-action**: Simple (e.g., "Link in bio")

### LinkedIn, Bluesky, Mastodon (Scientists)
- **Length**: 150-280 characters
- **Tone**: Technical but accessible, professional
- **Hook**: Research insight or practical application
- **Format**: Problem → insight → value
- **Call-to-action**: Professional (e.g., "Read the full analysis")

## Content Requirements

### Structure
1. Hook (first sentence grabs attention)
2. Context or insight (1-2 sentences)
3. Call-to-action with link

### Visual Elements
- **Describe images needed** per post:
  - Quote cards with most compelling insight
  - Exact text for quote card
  - Charts, diagrams, photos needed
  - Design guidance (colors, style, layout)
- Minimal text on images
- Consistent branding

### Engagement Elements
- **Hashtags**: 3-5 relevant only
  - Instagram: topic-specific + audience mix
  - LinkedIn/Bluesky/Mastodon: professional + topic only
- **Emojis**: 1-2 max per post
- **Links**: always include link to full content

## Sources

Claims need scientific paper — not social post. No paper → cannot use. Cite both sources when usable.

## Writing Guidelines

### Do:
- Active voice
- Specific numbers or facts
- Genuine curiosity (not clickbait)
- Match vocab to audience
- End with clear next step

### Don't:
- Marketing buzzwords or hype
- Promises content doesn't deliver
- Generic statements
- Overuse hashtags or emojis
- Write different versions for LinkedIn vs Bluesky vs Mastodon

## Formatting Guidelines

### Heading Hierarchy
- H1: main title only (one per page)
- H2: major sections
- H3: subsections
- H4: sparingly

### Paragraphs and Lists
- 2-3 sentences max per paragraph
- Bullet points for 3+ item lists
- Numbered lists only for sequential steps or rankings

### Links and References
- Inline source links
- Descriptive link text (not "click here")
- Format: [Source Name](URL) or DOI: [publication ID]

### Images and Media
- Describe images with specs
- Alt text for accessibility
- Lowercase hyphenated file names
- Captions when context needed

## SEO Guidelines

Priority order:

1. **SEO and discoverability**
2. **Readability and flow**

### Meta Information
- Title: 50-60 chars, include primary keyword
- Meta description: 150-160 chars, compelling + keyword
- URL slug: short, descriptive, main keyword

### Keywords
- 1 primary keyword per post
- 2-3 secondary keywords naturally placed
- Readability first

### Content Structure
- Front-load important info
- Keyword in first paragraph
- Keyword in at least one H2
- Internal links: 2-3 related posts
- External links: authoritative sources

### Technical
- Optimize images (compress, modern formats)
- Schema markup where applicable
- Mobile-friendly formatting

# Content Planning and Backlog

## Topic Management with GitHub Projects

GitHub Issues and Projects for planning, tracking, managing topics from idea to publication.

### Production Goals

- **Frequency**: One post every two weeks
- **Time per post**: 2 hours
- **Annual target**: 24 posts
  - 12 general public ("The Data in Your Life")
  - 12 scientists ("Data at Scale")

### GitHub Issues Structure

One issue per topic with:

#### Issue Title Format
`[Audience] Topic Title`

Examples:
- `[General Public] Why Your Fitness App Might Be Lying to You`
- `[Scientists] Building Reproducible Data Pipelines with DVC`

#### Required Labels

**Audience Labels** (one required):
- `audience:general-public`
- `audience:scientists`

**Stage Labels**:
- `stage:backlog`
- `stage:brainstorming`
- `stage:social-media-ready`
- `stage:published`

**Optional Labels**:
- `priority:high`
- `series:part-1`, `series:part-2`, etc.
- `collab`

#### Issue Template

```markdown
## Topic Overview
Brief description of the topic and why it matters to the target audience.

## Key Points to Cover
- Point 1
- Point 2
- Point 3

## Potential Sources
- [Source 1](URL or DOI)
- [Source 2](URL or DOI)

## Target Publication Date
YYYY-MM-DD (optional, based on two-week schedule)

## Notes
Any additional context, angles to explore, or related topics.
```

### GitHub Project Board

Views:

#### Board View (Primary)
1. **Backlog** (stage:backlog) — 24 topics minimum
2. **Brainstorming** (stage:brainstorming)
3. **Social Media Ready** (stage:social-media-ready)
4. **Published** (stage:published)

#### Table View (Audience Balance)
- Group by `audience` label
- Monitor 12/12 balance
- Sort by priority or date

#### Timeline View (Schedule)
- Visualize publication schedule
- Two-week spacing
- Plan seasonal/timely content

### Backlog Management

#### Initial Setup
24 issues (12 per audience) = six-month buffer.

#### Ongoing Maintenance
- Add ideas as they arise
- Monthly review for variety
- Balance evergreen with timely
- Keep 12+ in backlog always

#### Topic Selection Criteria
Topics must:
- Align with audience goals
- Have scientific sources
- Address real problems
- Provide actionable insights
- Not duplicate published content

### Workflow Integration with GitHub Issues

**Actively manage issues through workflow:**

#### Moving Issues Through Stages

1. **Backlog → Brainstorming**
   - Update labels: remove `stage:backlog`, add `stage:brainstorming`
   - Create folder `content-workflow/brainstorming/YYYY-MM-DD-slug/`
   - Comment on issue with folder location
   - Use: `gh issue edit <number> --remove-label "stage:backlog" --add-label "stage:brainstorming" --repo lpantano/myself`

2. **Brainstorming → Social Media Ready**
   - Update labels: remove `stage:brainstorming`, add `stage:social-media-ready`
   - Move to `content-workflow/social-media-ready/YYYY-MM-DD-slug/`
   - Comment confirming social assets done
   - Use: `gh issue edit <number> --remove-label "stage:brainstorming" --add-label "stage:social-media-ready" --repo lpantano/myself`

3. **Social Media Ready → Published**
   - Update labels: remove `stage:social-media-ready`, add `stage:published`
   - Move to `content-workflow/published/YYYY-MM-DD-slug/`
   - Copy to `content/post/`
   - Comment with publication URL
   - Close issue
   - Use: `gh issue edit <number> --remove-label "stage:social-media-ready" --add-label "stage:published" --repo lpantano/myself && gh issue close <number> --repo lpantano/myself`

#### Issue Comments
Track: progress/decisions, related issues, post-publication metrics, lessons learned.

#### Quick Commands Reference

```bash
# Create a new content topic issue
gh issue create --repo lpantano/myself --template content-topic.md

# List all backlog items
gh issue list --label "stage:backlog" --repo lpantano/myself

# List items by audience
gh issue list --label "audience:general-public" --repo lpantano/myself
gh issue list --label "audience:scientists" --repo lpantano/myself

# View project in browser
gh project view 5 --owner lpantano --web
```

# Content Workflow and Organization

## Folder Structure

```
/Users/lpantano/Code/webs/myself/
├── content-workflow/          # Content development (NOT in web build)
│   ├── brainstorming/        # Ideas and research
│   ├── social-media-ready/   # Complete posts with social content
│   └── published/            # Archive of published content
└── content/post/             # Final posts for website (web build only)
```

### content-workflow/ (Development Area)

All stages of development. Outside web build.

#### brainstorming/
- Ideas, concepts, research notes, sources, outline drafts, validation Q&A

Structure: `YYYY-MM-DD-post-slug/`

Example:
```
brainstorming/
└── 2026-01-09-data-manipulation-spotting/
    ├── idea.md              # Initial concept
    ├── research.md          # Sources and references
    ├── outline.md           # Post structure
    └── validation.md        # 3 questions + answers
```

#### social-media-ready/
- Final post draft, social posts, image specs, metadata/keywords

Structure: `YYYY-MM-DD-post-slug/`

Example:
```
social-media-ready/
└── 2026-01-09-data-manipulation-spotting/
    ├── post.md              # Final post content
    ├── social-instagram.txt
    ├── social-linkedin.txt  # Same content for LinkedIn/Bluesky/Mastodon
    ├── image-specs.md       # Descriptions of needed images (quote cards, charts)
    └── metadata.md          # SEO keywords, tags, description
```

#### published/
- Archive of published content

Structure: `YYYY-MM-DD-post-slug/`

Example:
```
published/
└── 2026-01-09-data-manipulation-spotting/
    ├── post.md              # Published version
    ├── metadata.md          # Publication info, URL, performance notes
    └── social/              # Copy of social posts used
```

### content/post/ (Web Build Only)

Final markdown with Hugo frontmatter. Only folder in website build.

Copy from `content-workflow/social-media-ready/[date-slug]/post.md` when publish-ready.

## Workflow Process

1. **Brainstorming** → `content-workflow/brainstorming/YYYY-MM-DD-post-slug/`
   - Write idea.md, research.md, outline.md
   - Complete validation.md
   - Update issue to `stage:brainstorming`

2. **Social Media Ready** → `content-workflow/social-media-ready/YYYY-MM-DD-post-slug/`
   - Write post.md
   - Create social posts (Instagram + LinkedIn/Bluesky/Mastodon)
   - image-specs.md, metadata.md
   - Update issue to `stage:social-media-ready`

3. **Publish** → `content/post/`
   - Add Hugo frontmatter
   - Archive to `content-workflow/published/YYYY-MM-DD-post-slug/`
   - Post social content
   - Update issue to `stage:published`, close

## File Naming Conventions

- **Date format**: YYYY-MM-DD (e.g., 2026-01-09)
- **Slug format**: lowercase-with-hyphens (e.g., data-manipulation-spotting)
- **Folder names**: `YYYY-MM-DD-post-slug/`
- **File names**: descriptive, lowercase (e.g., post.md, social-instagram.txt, image-specs.md)

# Tools and Commands

## When to Use Different Tools

### For Content Creation
- **Read tool**: Review existing posts for style
- **Write tool**: New files in content-workflow folders
- **Edit tool**: Refine drafts
- **Grep/Glob tools**: Search similar topics or patterns

### For GitHub Issues Management
- **Bash with gh CLI**: Create, update, close issues
- Always `--repo lpantano/myself`
- Update labels as content moves through stages
- Comments to track progress

### For File Organization
- **Bash**: Create folders, move files between stages
- Verify structure with `ls` before moving
- YYYY-MM-DD date format consistently

### For Research and Validation
- **WebSearch tool**: Recent scientific papers, authoritative sources
- **WebFetch tool**: Specific URLs for fact-checking
- Sources must be scientific papers, not social media

### For SEO and Optimization
- **Read existing posts**: Keyword usage patterns
- **Edit tool**: Headings, meta descriptions, internal links
- Readability first, keywords second

## Hugo Frontmatter Template

```yaml
---
title: "Post Title Here"
date: YYYY-MM-DD
draft: false
description: "150-160 character meta description with keyword"
categories: ["Data in Your Life"]  # or ["Data at Scale"]
tags: ["tag1", "tag2", "tag3"]
---
```

# Portfolio Structure

Portfolio items: `astro/src/content/portfolio/<slug>/index.md`
Featured images: `astro/public/portfolio/<slug>/featured.png`

## Frontmatter fields

```yaml
---
title: "Project Title"
summary: "One-sentence description for the card"
tags:
  - React          # short descriptive labels (tech + topic)
categories:
  - Web App        # what it is: Web App | Dashboard | Tool | etc.
audience:
  - Scientists     # who it's for: Scientists | General Public
date: "YYYY-MM-DD"
featured: true
url_demo: "https://..."   # optional
url_code: "https://..."   # optional
links:
  - name: Label
    url: https://...
---
```

## Audience mapping

- **Scientists** → "Data at Scale" (research tools, pipelines, clinical apps)
- **General Public** → "The Data in Your Life" (everyday data, health literacy, personal dashboards)