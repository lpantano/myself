# GitHub Project Setup for Content Planning

## Project Created
✅ **Project Name:** Content Planning & Production
✅ **Project URL:** https://github.com/users/lpantano/projects/5
✅ **Project Number:** 5

## Labels Created

The following labels have been created in your repository:

### Audience Labels (Required - pick one per issue)
- `audience:general-public` - Content for "The Data in Your Life" newsletter
- `audience:scientists` - Content for "Data at Scale" newsletter

### Stage Labels (Track workflow progress)
- `stage:backlog` - Topic idea, not yet started
- `stage:brainstorming` - Active research and outlining
- `stage:social-media-ready` - Draft complete, social posts created
- `stage:published` - Live on website and social media

### Optional Labels
- `priority:high` - Timely or urgent topic
- `collab` - Guest contributor or interview

## Issue Template Created

✅ Template file: `.github/ISSUE_TEMPLATE/content-topic.md`

When creating new issues, select "Content Topic" template and it will pre-populate with the structure you need.

## Next Steps: Configure Project Views

You'll need to manually configure the project views through the GitHub web interface. Here's how:

### 1. Open Your Project
Visit: https://github.com/users/lpantano/projects/5

### 2. Set Up Board View (Primary Workflow)

**Current Status:** The project has a default "Status" field with Todo/In Progress/Done.

**To customize for your workflow:**
1. Click on the "Status" field dropdown
2. Edit the Status field to match your stages:
   - Rename "Todo" → "Backlog"
   - Rename "In Progress" → "Brainstorming"
   - Rename "Done" → "Published"
   - Add new option: "Social Media Ready" (between Brainstorming and Published)

**Alternative approach (if you prefer using labels):**
1. In the board view, click the "⋮" menu → "Group by"
2. Select "Labels"
3. This will create columns based on your stage labels

### 3. Create Table View (Audience Balance)

1. Click the "+" button next to your current view
2. Select "New table"
3. Name it "Audience Balance"
4. Configure columns to show:
   - Title
   - Labels (to see audience type)
   - Status
   - Target Publication Date (if using milestone/date field)
5. Group by Labels → filter to show audience labels
6. This helps you track the 12/12 balance between general public and scientists

### 4. Create Timeline View (Publication Schedule)

1. Click the "+" button to add another view
2. Select "New board" or "New table" with date sorting
3. Name it "Publication Schedule"
4. Sort by: Target Publication Date or Milestone
5. This helps visualize your two-week publication cadence

### 5. Add Issues to Project

**Option 1: Add existing or new issues manually**
```bash
gh issue create --title "[General Public] Topic Title" --label "audience:general-public,stage:backlog" --repo lpantano/myself
```

**Option 2: Bulk create 24 starter issues**
Create a script or manually add 12 topics for each audience to build your initial backlog.

## Workflow Integration

### Moving Issues Through Stages

1. **Backlog → Brainstorming**
   - Change label from `stage:backlog` to `stage:brainstorming`
   - Create folder: `content-workflow/brainstorming/YYYY-MM-DD-slug/`
   - Assign to yourself

2. **Brainstorming → Social Media Ready**
   - Change label to `stage:social-media-ready`
   - Move folder to: `content-workflow/social-media-ready/YYYY-MM-DD-slug/`
   - Complete social media assets

3. **Social Media Ready → Published**
   - Copy post to `content/post/`
   - Publish to website and social platforms
   - Change label to `stage:published`
   - Archive to: `content-workflow/published/YYYY-MM-DD-slug/`
   - Close issue

## Quick Commands Reference

### Create a new content topic issue:
```bash
gh issue create --repo lpantano/myself --template content-topic.md
```

### List all backlog items:
```bash
gh issue list --label "stage:backlog" --repo lpantano/myself
```

### List items by audience:
```bash
gh issue list --label "audience:general-public" --repo lpantano/myself
gh issue list --label "audience:scientists" --repo lpantano/myself
```

### Move issue to next stage (example):
```bash
gh issue edit <issue-number> --remove-label "stage:backlog" --add-label "stage:brainstorming" --repo lpantano/myself
```

### View project in browser:
```bash
gh project view 5 --owner lpantano --web
```

## Tips

- Maintain at least 12 issues in backlog at all times (6-month buffer)
- Review backlog monthly for variety and balance
- Use issue comments to track progress and decisions
- Add publication URLs to issues when published
- Archive published issues but keep them closed (not deleted) for reference

## Automated Workflows (Optional Future Enhancement)

Consider adding GitHub Actions to:
- Auto-assign `stage:backlog` label to new content topic issues
- Notify when backlog drops below 12 issues
- Auto-close issues when moved to `stage:published`
- Track publication metrics in issue comments
