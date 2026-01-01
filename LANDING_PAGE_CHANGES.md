# Landing Page Restructure - Summary

## What Changed

Your homepage now shows **only** your biography and portfolio - creating a clean, focused first impression. All other content has been moved to separate dedicated pages.

## Homepage Structure (What Visitors See First)

**Active sections on homepage** (in order):
1. **About** (weight 20) - Your biography
2. **Portfolio** (weight 30) - Your project showcase
3. **Contact** (weight 130) - Contact information

**Everything else removed from homepage!**

## New Dedicated Landing Pages

Each of these now has its own page that visitors navigate to via the menu:

### 1. Tutorials Page
- **URL**: `/tutorials/`
- **File**: [content/tutorials/_index.md](content/tutorials/_index.md)
- **Description**: "Step-by-step guides for bioinformatics, genomics, and data visualization"
- **View**: Card layout
- Will display all posts with category "Tutorial"

### 2. Videos Page
- **URL**: `/videos/`
- **File**: [content/videos/_index.md](content/videos/_index.md)
- **Description**: "Watch and learn with video tutorials on bioinformatics and genomics"
- **View**: Card layout
- Will display all content from `content/videos/` directory

### 3. Blog Posts Page
- **URL**: `/post/`
- **File**: [content/post/_index.md](content/post/_index.md)
- **Title**: "Blog Posts"
- **Description**: "Insights, tutorials, and updates on bioinformatics and computational biology"
- **View**: Card layout (changed from compact)

### 4. Publications Page
- **URL**: `/publication/`
- **File**: [content/publication/_index.md](content/publication/_index.md)
- **Description**: "Peer-reviewed research in genomics, computational biology, and bioinformatics"
- **View**: Citation format
- Shows all your publications

## Updated Navigation Menu

**File**: [config/_default/menus.toml](config/_default/menus.toml)

New menu structure:
1. **Home** → Goes to About section (#about)
2. **Portfolio** → Shows portfolio on homepage (#projects)
3. **Tutorials** → Separate page (/tutorials/)
4. **Videos** → Separate page (/videos/)
5. **Posts** → Separate page (/post/)
6. **Publications** → Separate page (/publication/)
7. **Contact** → Contact section on homepage (#contact)
8. **CV** → Direct link to your CV PDF

## Deactivated Homepage Widgets

These sections are no longer on the homepage (set `active = false`):

- [content/home/tutorials.md](content/home/tutorials.md) - Now a separate page
- [content/home/videos.md](content/home/videos.md) - Now a separate page
- [content/home/posts.md](content/home/posts.md) - Now a separate page
- [content/home/featured.md](content/home/featured.md) - Now part of publications page
- [content/home/experience.md](content/home/experience.md) - Deactivated (info in CV)
- [content/home/talks.md](content/home/talks.md) - Deactivated

## User Experience Flow

**Before:**
- Visitor lands on homepage
- Has to scroll through: Bio → Portfolio → Tutorials → Videos → Posts → Publications → Contact
- Long, overwhelming page

**After:**
- Visitor lands on clean homepage
- Sees: Bio → Portfolio → Contact
- Can navigate to specific sections via menu
- Focused, professional first impression

## Benefits

1. **Cleaner Homepage**: Focus on who you are and what you've built
2. **Better Navigation**: Dedicated pages for different content types
3. **Professional**: Puts portfolio front and center
4. **Scalable**: Easy to add more content to each section without cluttering homepage
5. **SEO**: Each page can be optimized separately

## How Content is Organized Now

```
Homepage (/)
├── About (your bio)
├── Portfolio (your projects)
└── Contact

Tutorials (/tutorials/)
└── All posts with category="Tutorial"

Videos (/videos/)
└── All content from content/videos/

Posts (/post/)
└── All blog posts

Publications (/publication/)
└── All your publications
```

## Next Steps

To populate these pages with content:

### For Tutorials
Add `categories: ["Tutorial"]` to posts you want to appear on the tutorials page.

Example in post frontmatter:
```yaml
categories: ["Tutorial"]
tags: ["nextflow", "bioinformatics"]
```

### For Videos
Create video content in `content/videos/video-name/index.md` using the template at:
- [content/videos/example-video-tutorial/index.md](content/videos/example-video-tutorial/index.md)

### For Portfolio
Add more projects to `content/portfolio/` following the structure of:
- [content/portfolio/training-dashboard/](content/portfolio/training-dashboard/)

## Testing Your Changes

To see your new homepage structure:

```bash
hugo server -D
```

Then visit:
- http://localhost:1313 - Homepage (bio + portfolio only)
- http://localhost:1313/tutorials/ - Tutorials page
- http://localhost:1313/videos/ - Videos page
- http://localhost:1313/post/ - Posts page
- http://localhost:1313/publication/ - Publications page

## Summary

Your landing page is now **focused and impactful** - showing visitors who you are and what you've built, without overwhelming them with everything at once. Other content is easily accessible via dedicated pages in the navigation menu.
