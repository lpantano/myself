# Website Revamp - Implementation Summary

## Completed Changes

### 1. Navigation Menu Updated
**File**: [config/_default/menus.toml](config/_default/menus.toml)

Navigation now prioritizes portfolio content:
- Home → Portfolio → Tutorials → Videos → Posts → Publications → Contact → CV
- "DataBoards" renamed to "Portfolio"
- Publications moved lower in the menu order

### 2. Homepage Widgets Restructured
**Files**: [content/home/](content/home/)

**Active widgets** (in order of appearance):
1. **About** (weight 20) - Your bio
2. **Portfolio** (weight 30) - Project showcase with filters
3. **Tutorials** (weight 40) - NEW: Latest tutorial posts
4. **Videos** (weight 50) - NEW: Video content
5. **Posts** (weight 60) - Recent blog posts (limited to 4)
6. **Publications** (weight 70) - Selected publications (less prominent)
7. **Contact** (weight 90) - Contact form

**Deactivated widgets**:
- demo.md (was already inactive)
- slider.md (was already inactive)
- accomplishments.md (was already inactive)
- people.md (was already inactive)
- skills.md (was already inactive)
- experience.md (NOW inactive - info in CV)
- talks.md (NOW inactive - can link from about/CV)

### 3. Portfolio Section Enhanced
**File**: [content/home/projects.md](content/home/projects.md)

Changes:
- Title changed to "Portfolio" with subtitle "What I've built"
- View changed to "Showcase" (view=5) for visual impact
- Filter buttons added: All, Tools & Code, Visualizations, Case Studies
- Alternate row flipping enabled for visual variety

### 4. Bio Rewritten with Portfolio Focus
**File**: [content/authors/admin/_index.md](content/authors/admin/_index.md)

New bio structure:
- Lead with action-oriented introduction
- **What I Do** section highlighting:
  - Bioinformatics tools (seqcluster, bcbio, Nextflow)
  - Interactive dashboards
  - AI models for RNA
  - Cloud infrastructure
- Current work at Harvard Chan School
- Community leadership (podcast, WiB, AWIS, Nextflow Ambassador)
- Consulting work
- Background summary with link to full CV

### 5. New Content Structure Created

#### Portfolio Directory
**Location**: [content/portfolio/](content/portfolio/)

**Example project migrated**:
- [content/portfolio/training-dashboard/](content/portfolio/training-dashboard/) - Enhanced Training Progress Dashboard with:
  - Better categorization (Visualization tag)
  - Improved description and structure
  - Clear sections: Overview, Key Features, Technical Approach, Why It Matters
  - Live demo link

#### Videos Directory
**Location**: [content/videos/](content/videos/)

**Template created**:
- [content/videos/example-video-tutorial/](content/videos/example-video-tutorial/) - Shows how to structure video content with:
  - YouTube embedding options
  - Related content linking
  - Resource sections
  - Code examples
  - Currently set as draft (remove `draft: true` when ready)

#### Tutorial Widget
**File**: [content/home/tutorials.md](content/home/tutorials.md)

- Filters posts by category "Tutorial"
- Shows latest 3 tutorials
- Card view for visual appeal
- Subtitle: "Learn by doing"

#### Videos Widget
**File**: [content/home/videos.md](content/home/videos.md)

- Displays content from videos directory
- Shows up to 6 videos
- Card view with thumbnails
- Subtitle: "Watch and learn"

## Next Steps to Complete the Revamp

### 1. Install Hugo (if not already installed)
```bash
# macOS
brew install hugo

# Or download from https://gohugo.io/installation/
```

### 2. Test the Site Locally
```bash
cd /Users/lpantano/Code/webs/myself
hugo server -D
```

Visit `http://localhost:1313` to preview your changes.

### 3. Create More Portfolio Items

Create new portfolio items in `content/portfolio/` for your key projects. Suggested items based on your background:

**Tools & Code Projects**:
- **seqcluster**: Small RNA analysis tool
  - Tag: `Tools`
  - Link to GitHub repo
  - Highlight usage statistics if available

- **bcbio-nextgen contributions**: NGS pipeline framework
  - Tag: `Tools`
  - Highlight specific modules you developed
  - Link to documentation you wrote

- **Nextflow Pipelines**: Subsample pipeline and others
  - Tag: `Tools`
  - Link to GitHub repos
  - Include Seqera AI showcase post as related content

**Visualization Projects**:
- **Multi-omics Visualization Platform** (Harvard/Biotech work)
  - Tag: `Visualization`
  - Screenshots of dashboards
  - Anonymized examples if possible

- **RNA Structure Visualization**
  - Tag: `Visualization`
  - SHAPE-Seq/eCLIP-Seq data viz

**Case Studies**:
- **Fibrosis Research Multi-omics Analysis**
  - Tag: `Case Study`
  - Harvard/Boehringer collaboration
  - Anonymized methodology and outcomes

- **Target Discovery AI Pipeline**
  - Tag: `Case Study`
  - NextRNA work (anonymized)

### 4. Categorize Existing Posts as Tutorials

Review posts in `content/post/` and add category metadata:

For tutorial posts, add to frontmatter:
```yaml
categories: ["Tutorial"]
tutorial_level: "beginner"  # or intermediate, advanced
estimated_time: "30 minutes"
```

Example posts that could be tutorials:
- [content/post/2024/nextflow_seqera_ai_in_30min.md](content/post/2024/nextflow_seqera_ai_in_30min.md) - Add `categories: ["Tutorial"]`

### 5. Create Video Content

When you create tutorial videos:

1. Create a directory: `content/videos/video-title/`
2. Create `index.md` with frontmatter:
   ```yaml
   title: "Video Title"
   summary: "What viewers will learn"
   date: 2025-XX-XX
   categories: ["Tutorial"]
   youtube_id: "YOUR_VIDEO_ID"
   ```
3. Add description, resources, code examples
4. Link to related portfolio items or posts

### 6. Add Images

For best visual impact:

- **Portfolio items**: Add `featured.jpg` or `featured.png` to each project folder
- **Videos**: YouTube thumbnails are automatically used, or add custom `featured.jpg`
- **Tutorials**: Add header images to make cards more engaging

### 7. Update Configuration (Optional)

**Consider adding to [config/_default/config.toml](config/_default/config.toml)**:

If videos become a main content type, add to taxonomies section:
```toml
[taxonomies]
  tag = "tags"
  category = "categories"
  publication_type = "publication_types"
  author = "authors"
  video_type = "video_types"  # Optional for video categorization
```

### 8. Build and Deploy

Once you're happy with the changes:

```bash
# Build the site
hugo

# If using Netlify (based on netlify.toml in your repo)
git add .
git commit -m "Revamp: Portfolio-focused redesign with tutorials and videos

- Restructured navigation to prioritize portfolio content
- Created portfolio and videos sections
- Updated bio with action-oriented focus
- Deactivated experience/talks widgets (info in CV)
- Enhanced Training dashboard as portfolio example
"
git push
```

## File Structure Overview

```
content/
├── authors/
│   └── admin/
│       └── _index.md (UPDATED - portfolio-focused bio)
├── home/
│   ├── about.md (kept)
│   ├── projects.md (UPDATED - now Portfolio)
│   ├── tutorials.md (NEW)
│   ├── videos.md (NEW)
│   ├── posts.md (updated)
│   ├── featured.md (updated - Selected Publications)
│   ├── contact.md (kept)
│   ├── experience.md (DEACTIVATED)
│   ├── talks.md (DEACTIVATED)
│   └── [other deactivated widgets]
├── portfolio/ (NEW DIRECTORY)
│   └── training-dashboard/
│       └── index.md (migrated and enhanced)
├── videos/ (NEW DIRECTORY)
│   └── example-video-tutorial/
│       └── index.md (template)
├── post/
│   └── [existing posts - categorize as tutorials]
└── project/
    └── Training/ (original - can keep or remove)
```

## Success Indicators

Your revamped site now:
- ✅ Prioritizes portfolio content in navigation
- ✅ Showcases "what you've built" before credentials
- ✅ Has dedicated sections for tutorials and videos
- ✅ Presents publications in a less prominent position
- ✅ Features an action-oriented bio highlighting tools and platforms
- ✅ Has structure ready for new portfolio items and video content
- ✅ Uses visual showcase layout for portfolio items
- ✅ Includes filtering for different portfolio types

## Tips for Creating Content

### For Portfolio Items:
1. Start with the problem you solved
2. Highlight the technical approach
3. Show the results/impact
4. Include live demos or GitHub links
5. Add screenshots or diagrams

### For Tutorials:
1. Clear learning objectives upfront
2. Prerequisites section
3. Step-by-step instructions
4. Code examples with syntax highlighting
5. "What you learned" summary
6. Link to related portfolio items

### For Videos:
1. Embed from YouTube for best performance
2. Include written summary for SEO
3. Provide resources and links mentioned in video
4. Cross-link to related tutorials or portfolio items
5. Add timestamps in description for long videos

## Questions or Issues?

If you encounter any issues:
1. Check Hugo version (needs 0.119.0 or later for Wowchemy)
2. Run `hugo server -D` to see build errors
3. Check [Wowchemy documentation](https://wowchemy.com/docs/)
4. Verify all frontmatter YAML is valid

Good luck with your revamped portfolio site!
