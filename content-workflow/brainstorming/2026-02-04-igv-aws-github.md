# Building Collaborative Genomics Dashboards Without a Development Team

## Voice Memo Transcript

I want to share a project where I have data from multiple collaborators and the data is heterogeneous—could be single-cell RNA, ChIP-seq, or other types. We needed to visualize and create an app to share results across all of them in a way that people could access the data through a link, authenticate, and explore it.

But we didn't have a dedicated development team or lots of time. So the strategy was to compose existing pieces that are good enough. We focused on human genome data to simplify coordination across species.

The main question researchers asked was always: "Go to this gene and tell me what happened across all these experiments and projects. Was it significant? What signal did we see?"

So we looked at IGV—the web app version—because you can jump from gene to gene and load different types of data. We started with the basics: visualize BED files, bigWig files, bedGraph files. For data that didn't fit these formats, we'd translate it. For example, differential expression results are typically in CSV format with gene names and significance values. We created a conversion pipeline that translates these into color-coded BED files, showing the result of each experiment.

The automation script checks the data folder, identifies file types, and handles them accordingly. If it's already IGV-compatible, it leaves it. If it's differential expression data, it converts it to BED format and checks the species—if it's not human, it translates the coordinates to human genome positions so everything is searchable in the same reference.

Then the script generates a track registry file for IGV with all the new tracks and their types. We organized the data hierarchically: three main projects, with experiments within each. In IGV, this translates to three track menus, and when you open any project, you see the individual experiments in a searchable table format.

The challenge was continuous deployment. We storage everything on AWS S3 in a private bucket. We use Lambda functions that require user authentication (username and password) to access the data—only authorized collaborators can see it.

For continuous updates, we set up a GitHub Action that runs on schedule or on demand. Whenever new data is added to the source folders, we trigger the action. It runs the conversion script again, updates the registry files, and uploads everything to S3. Within seconds, the new data is live in the app.

The whole approach doesn't require someone with backend expertise to manually deploy updates. It's true continuous integration. It's not fancy, but it's smart for our resources. If you have a similar challenge in your research—multiple collaborators, heterogeneous data, limited budget—this approach might inspire you.

---

## Content Structure for Blog Post

### Hook
Most collaborative genomics projects fail not because the science is hard, but because sharing and exploring data across experiments is hard. We solved this with composition, not custom code.

### Context
- Challenge: Heterogeneous data from multiple collaborators
- Constraint: No dedicated dev team
- Goal: Single interface to explore any gene across all experiments

### The Solution
1. Choose the right existing tools (IGV for interactive browsing)
2. Standardize everything into compatible formats (BED files)
3. Automate the translation and deployment (GitHub Actions + AWS)

### The Technical Details
- Format conversion: CSV → BED with species translation
- Hierarchical organization: Projects → Experiments → Tracks
- Continuous deployment via GitHub Actions and S3
- Authentication layer via Lambda

### The Lesson
You don't need a development team to build sophisticated research infrastructure. You need: clear problem definition, existing tools that solve 80% of it, and automation to handle the rest.

---

## Validation Questions & Answers

### Question 1: Is the technical explanation clear enough for a scientist who's not a bioinformatician?

**Answer:** Partially. The post explains *what* happens (CSV → BED → IGV), but could be clearer on *why* it matters:
- BED files are the lingua franca of genomic viewers—they encode genomic locations with associated data
- Species translation isn't trivial—genes have different coordinates in different organisms; automation prevents manual lookup errors
- Hierarchical organization in IGV reduces cognitive load when navigating hundreds of experiments

The post should include a concrete example: "A gene found significant in mouse experiments gets automatically translated to its human ortholog coordinates, making cross-species comparison seamless."

### Question 2: Does the post emphasize the resourcefulness angle?

**Answer:** Yes, but it could be stronger. The post should frame decisions as deliberate constraints that led to creativity:
- Instead of "we use IGV because it's available," frame it as "we analyzed what tools exist, found IGV already solved 80% of the browsing problem, and focused engineering on the 20% it doesn't: data format conversion and automation"
- Highlight what they *didn't* build: no custom visualization code, no authentication system from scratch, no manual deployment process
- Compare to the implicit alternative: hiring a developer to build this from scratch (expensive, time-consuming)

### Question 3: Is there enough specificity about the problem?

**Answer:** Yes for the audience, but context helps. The voice memo mentions "multiple species" and "differential expression results," which scientists will understand. However, a concrete example strengthens it:

"Your collaborators send you differential expression results from their single-cell RNA experiments. Some work is in mouse, some in human. Your task: find the gene they identified as significant, check its signal in all other experiments, and compare across species. With our approach, you paste one gene name into IGV, and immediately see all experiments across the genome build."

---

## Ready for Next Steps

This content is ready to move to **social-media-ready** stage. Next steps:
1. Write the final polished blog post
2. Create video script for tutorial/case study format
3. Create social media posts for LinkedIn/Bluesky/Mastodon and Instagram
4. Design quote card with key insight
