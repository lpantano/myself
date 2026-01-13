This is your constitution for the project. Here you should follow the rules to create content and code. 

# For content creation

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

The tone to create text and scripts SHOULD be amicable and encouraging. As well as concise. Use the minimum number of words needed to explain a concept. USE short sentences and simple vocabulary. USE short paragraphs. 

Don't use shame or blame to attract readers. I don't want to pick up fights with anybody. I want to help people to have power to understand data.

Always REFER to sources used: URLs or scientific publication IDs.

## Title

Should be short and create curiosity. Avoid words commonly used in marketing. Be direct and don't mislead people.


## Content Creation Process

1. Create initial content draft
2. Generate 3 validation questions about the content
3. Answer each question independently
4. Use these answers to refine and create the final content

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
- Include a quote card for every post
- Feature the most compelling insight or takeaway
- Use consistent branding
- Keep text on image minimal and readable

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
- Include alt text for all images
- Keep file names descriptive and lowercase with hyphens
- Add captions when context is needed

## SEO Guidelines

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

### Workflow Integration

#### Moving Issues Through Stages

1. **Backlog → Brainstorming**
   - Assign issue to yourself
   - Change label to `stage:brainstorming`
   - Create folder in `content-workflow/brainstorming/YYYY-MM-DD-slug/`
   - Link folder location in issue comment

2. **Brainstorming → Social Media Ready**
   - Change label to `stage:social-media-ready`
   - Move folder to `content-workflow/social-media-ready/YYYY-MM-DD-slug/`
   - Complete all social media assets
   - Update issue with completion checklist

3. **Social Media Ready → Published**
   - Copy post to `content/post/`
   - Publish to website and social platforms
   - Change label to `stage:published`
   - Archive in `content-workflow/published/YYYY-MM-DD-slug/`
   - Add publication URL to issue
   - Close issue

#### Issue Comments
Use comments to:
- Track progress and decisions made
- Link to related issues or content
- Note performance metrics after publication
- Document lessons learned

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
- Quote card assets
- Metadata and keywords

Structure: `YYYY-MM-DD-post-slug/`

Example:
```
social-media-ready/
└── 2026-01-09-data-manipulation-spotting/
    ├── post.md              # Final post content
    ├── social-instagram.txt
    ├── social-linkedin.txt  # Same content for all scientist platforms
    ├── assets/
    │   └── quote-card.png
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

2. **Social Media Ready** → Move to `content-workflow/social-media-ready/YYYY-MM-DD-post-slug/`
   - Write final post.md
   - Create social media posts (Instagram + LinkedIn)
   - Generate quote card
   - Document metadata (keywords, description)

3. **Publish** → Copy final post to `content/post/`
   - Add Hugo frontmatter to post
   - Archive copy to `content-workflow/published/YYYY-MM-DD-post-slug/`
   - Post social media content

## File Naming Conventions

- **Date format**: YYYY-MM-DD (e.g., 2026-01-09)
- **Slug format**: lowercase-with-hyphens (e.g., data-manipulation-spotting)
- **Folder names**: `YYYY-MM-DD-post-slug/`
- **File names**: descriptive, lowercase (e.g., post.md, social-instagram.txt, quote-card.png)