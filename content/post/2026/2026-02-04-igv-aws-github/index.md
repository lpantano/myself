---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Multi-Lab Genomics Data Sharing with IGV, S3, and GitHub Actions"
subtitle: "Composing existing tools to solve collaborative research infrastructure without a dev team"
summary: "How to build collaborative research infrastructure using IGV, format conversion, and GitHub Actions automation—without a dedicated development team."
authors: []
tags: ["genomics", "igv", "aws", "github-actions", "bioinformatics", "research-infrastructure", "automation"]
categories: ["Data at Scale"]
date: 2026-02-04T12:00:00-04:00
lastmod: 2026-02-04T12:00:00-04:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

Most collaborative genomics projects fail not because the science is hard, but because managing and sharing heterogeneous data across collaborators is hard.

We solved this problem by composing existing tools instead of building custom code. Here's how.

TLDR: 

- [GitHub available](https://github.com/lpantano/igv-web-genomics-platform/tree/main)
- [YouTube](https://youtu.be/_qPsqCyFsgg)

Thanks to [Ruitong Li](https://www.linkedin.com/in/ruitong-li-6a83a0149/) for contributing to the project.

## The Problem

Your collaborators send differential expression results from their single-cell RNA and ATAC-seq experiments. Some work is in mouse, some in human. Your task: find the genes they identified as significant, check the signal in all other experiments, and compare across species—all from a single interface.

Without infrastructure, this means emailing files, manually looking up gene coordinates, translating between genome builds (mouse to human), and checking signal experiment by experiment. It doesn't scale. Collaborators wait. Nobody wins.

## The Solution: Composition Over Complexity

![Architecture diagram showing data flow from collaborators through AWS S3, GitHub Actions, CloudFront, Lambda authentication, and into the IGV Web App](architecture-diagram.png)

We focused on three decisions:

### 1. Choose Tools That Do 80% of the Work

We selected [IGV (Integrative Genomics Viewer)](https://igv.org/)—the web app version. It's a professional genome browser designed for exactly what we needed: jumping between genes, loading multiple data types, fast interactive navigation. We didn't build visualization code; IGV handles that elegantly.

### 2. Standardize Everything Into Compatible Formats

IGV natively understands a few core formats: BED files (genomic regions with annotations), BigWig files (signal tracks), and narrowPeak files (ATAC-seq peaks). Our collaborators send data in CSV format from DESeq2.

We built an automated pipeline that:

- **Detects file types**: ATAC-seq BigWig/BED files, RNA-seq CSV files
- **Converts DESeq2 results** → color-coded BED files with four-tier significance coloring:
  - **Red**: Up-regulated (p < 0.05 & log2FC > 1.5)
  - **Blue**: Down-regulated (p < 0.05 & log2FC < -1.5)
  - **Orange**: Significant but low fold change (p < 0.05 & |log2FC| < 1.5)
  - **Gray**: Not significant
- **Translates cross-species data**: If the DESeq2 results are from mouse, the pipeline maps mouse genes to human orthologs and converts coordinates to hg38—automatically
- **Leaves compatible formats as-is**: ATAC-seq peaks and BigWig files pass through unchanged

The script scans project folders, identifies each file type, applies the appropriate transformation, and generates a track registry describing everything for IGV.

### 3. Automate Everything, Including Deployment

We organized data hierarchically: three main research projects, with experiments nested inside. When you open IGV, you see a project modal. Click a project, and you get a searchable table of all its experiments—grouped by experiment ID or data type.

Everything lives on AWS S3. Lambda@Edge functions enforce password authentication at the CloudFront edge—only authorized collaborators can access the data. Passwords are shared securely with the team.

For continuous updates, we use GitHub Actions. Set it to run daily or trigger manually. When new data arrives in the S3 data folder, the action:

1. Scans all projects for new CSV files
2. Runs the conversion script on anything new (skips already-converted files)
3. Updates the track registry (CSV and JSON files)
4. Syncs metadata back to S3
5. Fixes MIME types for BigWig files
6. Invalidates the CloudFront cache

Within seconds, new data is live in IGV. No manual deployment. No command-line expertise required. The whole team benefits from new data immediately.

## Technical Implementation

Here's what makes this work technically:

**Data Organization:**
Three projects (`project1`, `project2`, `project3`), each containing experiment subfolders with BED, BigWig, or CSV files.

**Automation Script** ([automate_igv_tracks.py](https://github.com/hbc/app-igv-skinpo1/blob/main/scripts/automate_igv_tracks.py)):
- Auto-scans the entire data directory recursively
- Identifies ATAC-seq files (.bed, .narrowPeak, .bw) and RNA-seq CSV files
- Converts new CSV files to BED using the `create_igv_bed.py` converter (skips if BED already exists)
- Generates `project_name.csv` with track metadata (type, URL, display options)
- Generates `project_name.json` with IGV configuration
- Updates the central `trackRegistry.json`
- Optional: `--dry-run` flag to preview changes before applying

**Format Conversion** ([create_igv_bed.py](https://github.com/hbc/app-igv-skinpo1/blob/main/scripts/create_igv_bed.py)):
- Reads DESeq2 output (gene_id, log2FoldChange, p-value columns)
- Species detection: Automatically recognizes mouse or human (looks for MGI gene symbols or Ensembl IDs)
- Species translation: Maps mouse genes to human orthologs and converts coordinates
- Creates color-coded BED files with biological meaning (red=up, blue=down, orange=borderline)

**Deployment to Production:**
- S3 bucket stores all data and configuration files
- CloudFront CDN sits in front for fast global access
- Lambda@Edge enforces authentication at edge nodes globally
- GitHub Actions runs daily: mounts S3 folder, runs automation, syncs results back, invalidates CloudFront cache

**Access Control:**
Basic HTTP authentication (username/password) enforced at CloudFront. No backend needed. Users authenticate once in their browser, then browse the genome naturally.

## Why This Approach Works

We didn't have a development team or a large budget. So we focused on composition: choosing tools that solve 80% of the problem, automating the 20% they don't handle.

This approach has three advantages:

**It scales.** As new collaborators join and new data arrives, the same automation handles it. No new code needed. The GitHub Action handles everything.

**It's maintainable.** The GitHub Action runs on a schedule you set. The conversion script is pure Python—transparent and understandable. Version control means you can roll back if something breaks.

**It's focused on the science.** Researchers spend time analyzing genes, not wrestling with deployment pipelines. They add a CSV file to a folder. Within minutes, it's browsable alongside all their collaborators' data.

## The Lesson

You don't need a development team to build research infrastructure. You need:

1. Clear problem definition (one gene, all experiments)
2. Existing tools that solve most of it (IGV for browsing)
3. Automation to handle the gaps (Python script + GitHub Actions)

If you have a similar challenge—multiple collaborators, heterogeneous data, limited resources—this approach works. Look for the existing tool that's 80% of your solution. Build automation for the 20% it doesn't cover. Deploy it once, then let it run.

The full code is available on [GitHub](https://github.com/hbc/app-igv-skinpo1). It includes:
- The Python automation pipeline
- AWS deployment scripts
- GitHub Actions workflow
- Complete documentation for adding new datasets

## Limitations and Future Work

- **Cross-species support**: Currently handles mouse→human translation for RNA-seq only. Other species would need custom ortholog mappings. Other data types need additional code.
- **User management**: Today uses a shared password. For multiple independent users, consider Amazon Cognito or similar.

These aren't blockers for most research groups, but they're worth noting if you're adapting this approach.
