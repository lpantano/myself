This is your constitution for the project. Here you should follow the rules to create content and code. 

# For content creation

Sometimes we do analysis, for that follow these rules:

- work on analysis folder, one folder for analysis
- help find data source
- use R to make plots
- use ggprism and grafify for colors

We have two types of content distribution: video tutorials and regular posts.

We have two types of content material:

## FOR GENERAL PUBLIC:

Title: "The Data in Your Life"
Description:
You're already living in a world shaped by data—health apps tracking your sleep, news headlines citing studies, companies predicting your behavior. But can you tell when the numbers are telling the truth? This newsletter breaks down real-world data you encounter daily, teaching you to spot manipulation, question conclusions, and make decisions based on what the evidence actually shows. No statistics degree required—just curiosity and a refusal to be misled.

## FOR SCIENTISTS:

Title: "Data at Scale" (or "Accelerating Discovery")
Description:
You know how to analyze data. But are you analyzing it efficiently? This newsletter is for researchers who want to build better pipelines, break down departmental silos, and leverage AI tools to accelerate discovery. I'll share technical strategies, real-world case studies, and frameworks for collaborative analysis that actually work. Less time wrestling with infrastructure, more time finding what matters.

## Tone

### For General Public ("The Data in Your Life")
- **Curious and investigative**: Take a "let's figure this out together" approach
- Lead with questions that create intrigue
- Reveal insights gradually, making it feel like discovery
- Use real-world examples readers encounter daily
- Keep vocabulary simple but not condescending
- Avoid jargon; when technical terms are needed, explain them immediately
- Short sentences and paragraphs (2-3 sentences maximum)

### For Scientists ("Data at Scale")
- **Peer-to-peer practical**: Share solutions that actually work
- Technical but accessible—assume knowledge but don't assume familiarity with every tool
- Acknowledge trade-offs and limitations openly
- Focus on implementation details that matter
- Include command examples, code snippets, and real workflows
- Time savings and efficiency are valuable—mention them when relevant
- Don't oversell—be honest about what works and what doesn't

### Universal Tone Guidelines
- **Concise**: Use the minimum words needed to explain a concept
- **Amicable and encouraging**: Help people feel empowered, not inadequate
- **Direct**: No marketing buzzwords or hype language
- **Non-confrontational**: Don't pick fights or shame readers
- **Evidence-focused**: Always back claims with sources

## Core Values

Every piece of content must embody these values:

### 1. Transparency and Honesty
- Always cite sources (URLs or DOIs)
- Show limitations of data, methods, or conclusions
- If something is uncertain or speculative, say so explicitly
- Never hide complexity that matters to understanding

### 2. Evidence-Based
- Claims require scientific paper backing—no social media sources
- Link directly to DOIs or authoritative sources
- If scientific evidence doesn't exist for a claim, we cannot use it
- Distinguish between established findings and emerging research

### 3. Accessibility
- Break down barriers to understanding
- Remove gatekeeping language
- Meet readers where they are
- Complex topics should be learnable by anyone with curiosity

## Title

Should be short and create curiosity. Avoid words commonly used in marketing. Be direct and don't mislead people.


## Content Creation Process

**ALWAYS use the full workflow for every post:**

1. Create initial content draft in `content-workflow/brainstorming/YYYY-MM-DD-slug/`
2. Generate 3 validation questions about the content
3. Answer each question independently
4. Use these answers to refine and create the final content
5. Move to `content-workflow/social-media-ready/YYYY-MM-DD-slug/`
6. Create social media posts and describe needed visual assets
7. Copy final post to `content/post/` only when ready to publish

(Note: The validation questions are for internal use only and should not appear in the published content.)

# Social Media Guidelines

Create for each content piece:
- One Instagram post for general public
- One post for LinkedIn, Bluesky, and Mastodon (same version for all three)

## Platform-Specific Approach

### Instagram (General Public)
- **Length**: Under 125 characters (visible without "more" button)
- **Tone**: Casual, storytelling, relatable
- **Hook**: Lead with curiosity or a surprising fact
- **Format**: Question or statement that creates intrigue
- **Call-to-action**: Direct and simple (e.g., "Link in bio")

### LinkedIn, Bluesky, Mastodon (Scientists)
- **Length**: 150-280 characters
- **Tone**: Technical but accessible, professional
- **Hook**: Lead with the research insight or practical application
- **Format**: Problem → insight → value
- **Call-to-action**: Professional (e.g., "Read the full analysis")

## Content Requirements

### Structure
1. Hook (first sentence must grab attention)
2. Context or insight (1-2 sentences)
3. Call-to-action with link

### Visual Elements
- **Describe images needed** for every post:
  - Quote cards featuring the most compelling insight
  - Specify exact text for the quote card
  - Note any charts, diagrams, or photos needed
  - Include design guidance (colors, style, layout)
- Keep text on images minimal and readable
- Maintain consistent branding

### Engagement Elements
- **Hashtags**: 3-5 highly relevant tags only
  - Instagram: Mix of topic-specific and audience tags
  - LinkedIn/Bluesky/Mastodon: Professional and topic-focused only
- **Emojis**: Use 1-2 relevant emojis per post maximum
- **Links**: Always include link to full content

## Sources

All sources that are claiming something from me should be a scientific paper, not a social post. If there is no scientific paper, then we cannot use that as a claim. Cite both sources in the content in the case we can use it.

## Writing Guidelines

### Do:
- Write in active voice
- Use specific numbers or facts when available
- Create genuine curiosity (not clickbait)
- Match vocabulary to audience (simple for Instagram, technical for scientists)
- End with clear next step

### Don't:
- Use marketing buzzwords or hype language
- Make promises the content doesn't deliver
- Write generic statements that could apply to anything
- Overuse hashtags or emojis
- Write different versions for LinkedIn vs Bluesky vs Mastodon (use same post)

## Formatting Guidelines

### Heading Hierarchy
- Use H1 for main title only (one per page)
- Use H2 for major sections
- Use H3 for subsections
- Use H4 sparingly for minor subdivisions

### Paragraphs and Lists
- Keep paragraphs to 2-3 sentences maximum
- Use bullet points for lists of 3+ items
- Use numbered lists only for sequential steps or rankings

### Links and References
- Link to sources inline where mentioned
- Use descriptive link text (not "click here")
- Format citations as: [Source Name](URL) or DOI: [publication ID]

### Images and Media
- Describe needed images with specifications
- Include alt text descriptions for accessibility
- Keep file names descriptive and lowercase with hyphens
- Add captions when context is needed

## SEO Guidelines

When editing or reviewing posts, prioritize:

1. **SEO and discoverability**
2. **Readability and flow**

### Meta Information
- Title: 50-60 characters, include primary keyword
- Meta description: 150-160 characters, compelling summary with keyword
- URL slug: short, descriptive, include main keyword

### Keywords
- Focus on 1 primary keyword per post
- Include 2-3 related secondary keywords naturally
- Don't force keywords; prioritize readability

### Content Structure
- Front-load important information
- Include keyword in first paragraph
- Use keywords in at least one H2 heading
- Internal links: link to 2-3 related posts when relevant
- External links: cite authoritative sources

### Technical
- Optimize images (compress, use modern formats)
- Use schema markup where applicable
- Ensure mobile-friendly formatting

# Content Planning and Backlog

## Topic Management with GitHub Projects

We use GitHub Issues and Projects to plan, track, and manage content topics from idea to publication.

### Production Goals

- **Publication frequency**: One post every two weeks
- **Time per post**: 2 hours (full creation process)
- **Annual target**: 24 posts total
  - 12 posts for general public ("The Data in Your Life")
  - 12 posts for scientists ("Data at Scale")

### GitHub Issues Structure

Each content topic gets its own GitHub Issue with the following components:

#### Issue Title Format
`[Audience] Topic Title`

Examples:
- `[General Public] Why Your Fitness App Might Be Lying to You`
- `[Scientists] Building Reproducible Data Pipelines with DVC`

#### Required Labels

**Audience Labels** (one required per issue):
- `audience:general-public` - Content for "The Data in Your Life" newsletter
- `audience:scientists` - Content for "Data at Scale" newsletter

**Stage Labels** (tracks progress through workflow):
- `stage:backlog` - Topic idea, not yet started
- `stage:brainstorming` - Active research and outlining
- `stage:social-media-ready` - Draft complete, social posts created
- `stage:published` - Live on website and social media

**Optional Labels**:
- `priority:high` - Timely or urgent topic
- `series:part-1`, `series:part-2`, etc. - Multi-part content
- `collab` - Guest contributor or interview

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

Create a GitHub Project with these views:

#### Board View (Primary)
Columns representing workflow stages:
1. **Backlog** (stage:backlog) - 24 topics minimum
2. **Brainstorming** (stage:brainstorming) - Active research
3. **Social Media Ready** (stage:social-media-ready) - Ready to publish
4. **Published** (stage:published) - Live content

#### Table View (Audience Balance)
Track distribution across audiences:
- Group by `audience` label
- Monitor 12 general public vs 12 scientists balance
- Sort by priority or target date

#### Timeline View (Schedule)
- Visualize publication schedule
- Ensure two-week spacing between posts
- Plan seasonal or timely content

### Backlog Management

#### Initial Setup
Create 24 issues (12 per audience) to establish a six-month buffer.

#### Ongoing Maintenance
- Add new topic ideas as they arise
- Review backlog monthly to ensure variety
- Balance evergreen content with timely topics
- Maintain at least 12 issues in backlog at all times

#### Topic Selection Criteria
Topics should:
- Align with audience description and goals
- Have available scientific sources (no social media sources)
- Address real problems or questions
- Provide actionable insights
- Avoid duplication with published content

### Workflow Integration with GitHub Issues

**Claude should actively manage GitHub issues throughout the content workflow:**

#### Moving Issues Through Stages

1. **Backlog → Brainstorming**
   - Update issue labels: remove `stage:backlog`, add `stage:brainstorming`
   - Create folder in `content-workflow/brainstorming/YYYY-MM-DD-slug/`
   - Add comment to issue with folder location
   - Use: `gh issue edit <number> --remove-label "stage:backlog" --add-label "stage:brainstorming" --repo lpantano/myself`

2. **Brainstorming → Social Media Ready**
   - Update labels: remove `stage:brainstorming`, add `stage:social-media-ready`
   - Move folder to `content-workflow/social-media-ready/YYYY-MM-DD-slug/`
   - Add comment confirming completion of social media assets
   - Use: `gh issue edit <number> --remove-label "stage:brainstorming" --add-label "stage:social-media-ready" --repo lpantano/myself`

3. **Social Media Ready → Published**
   - Update labels: remove `stage:social-media-ready`, add `stage:published`
   - Move folder to `content-workflow/published/YYYY-MM-DD-slug/`
   - Copy final post to `content/post/`
   - Add comment with publication URL
   - Close issue
   - Use: `gh issue edit <number> --remove-label "stage:social-media-ready" --add-label "stage:published" --repo lpantano/myself && gh issue close <number> --repo lpantano/myself`

#### Issue Comments
Use comments to:
- Track progress and decisions made during creation
- Link to related issues or content
- Note performance metrics after publication
- Document lessons learned

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

The project separates content creation workflow from the final web content:

```
/Users/lpantano/Code/webs/myself/
├── content-workflow/          # Content development (NOT in web build)
│   ├── brainstorming/        # Ideas and research
│   ├── social-media-ready/   # Complete posts with social content
│   └── published/            # Archive of published content
└── content/post/             # Final posts for website (web build only)
```

### content-workflow/ (Development Area)

This folder contains all stages of content development and stays outside the web build process.

#### brainstorming/
- Initial ideas and concepts
- Research notes and sources
- Outline drafts
- Validation questions and answers

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
- Final draft of post (markdown)
- Social media posts for all platforms
- Image specifications and requirements
- Metadata and keywords

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
- Archive of what's been published
- Publication date and performance notes
- Link to live post

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

Final markdown files with Hugo frontmatter go here. This is the only folder included in the website build.

Copy the final post from `content-workflow/social-media-ready/[date-slug]/post.md` to here once ready to publish.

## Workflow Process

1. **Brainstorming** → Create folder in `content-workflow/brainstorming/YYYY-MM-DD-post-slug/`
   - Write idea.md, research.md, outline.md
   - Complete validation questions in validation.md
   - Update GitHub issue to `stage:brainstorming`

2. **Social Media Ready** → Move to `content-workflow/social-media-ready/YYYY-MM-DD-post-slug/`
   - Write final post.md
   - Create social media posts (Instagram + LinkedIn/Bluesky/Mastodon)
   - Document image specifications in image-specs.md
   - Document metadata (keywords, description)
   - Update GitHub issue to `stage:social-media-ready`

3. **Publish** → Copy final post to `content/post/`
   - Add Hugo frontmatter to post
   - Archive copy to `content-workflow/published/YYYY-MM-DD-post-slug/`
   - Post social media content
   - Update GitHub issue to `stage:published` and close

## File Naming Conventions

- **Date format**: YYYY-MM-DD (e.g., 2026-01-09)
- **Slug format**: lowercase-with-hyphens (e.g., data-manipulation-spotting)
- **Folder names**: `YYYY-MM-DD-post-slug/`
- **File names**: descriptive, lowercase (e.g., post.md, social-instagram.txt, image-specs.md)

# Tools and Commands

## When to Use Different Tools

### For Content Creation
- **Read tool**: Review existing posts for style reference
- **Write tool**: Create new files in content-workflow folders
- **Edit tool**: Refine existing drafts
- **Grep/Glob tools**: Search for similar topics or patterns across posts

### For GitHub Issues Management
- **Bash with gh CLI**: Create, update, and close issues
- Always use `--repo lpantano/myself` with gh commands
- Update labels as content moves through workflow stages
- Add comments to track progress

### For File Organization
- **Bash**: Create folders, move files between workflow stages
- Verify folder structure with `ls` before moving files
- Use date format YYYY-MM-DD consistently

### For Research and Validation
- **WebSearch tool**: Find recent scientific papers and authoritative sources
- **WebFetch tool**: Retrieve content from specific URLs for fact-checking
- Always verify sources are scientific papers, not social media

### For SEO and Optimization
- **Read existing posts**: Check keyword usage patterns
- **Edit tool**: Optimize headings, meta descriptions, internal links
- Focus on readability first, keywords second

## Hugo Frontmatter Template

When copying to `content/post/`, use this frontmatter structure:

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

# currentDate
Today's date is 2026-02-15.