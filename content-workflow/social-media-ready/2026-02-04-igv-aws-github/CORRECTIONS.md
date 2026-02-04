# Content Corrections from Repository Review

This document tracks corrections made to the initial content based on a thorough review of the GitHub repository source code.

## Key Corrections Made

### 1. **Color Coding Accuracy**
**Original (from audio):** "Green for upregulated, Red for downregulated"
**Corrected:** Red for up-regulated, Blue for down-regulated, Orange for borderline, Gray for not significant
**Source:** [scripts/create_igv_bed.py](https://github.com/hbc/app-igv-skinpo1/blob/main/scripts/create_igv_bed.py) documentation

### 2. **Data Organization**
**Original:** "Multiple projects" (vague)
**Corrected:** Three specific projects (`project1_reprogramming`, `project2_epigenetics`, `project3_abcb5`)
**Source:** [README.md repository structure](https://github.com/hbc/app-igv-skinpo1/blob/main/README.md)

### 3. **Automation Script Behavior**
**Original:** "Script converts CSV files to BED"
**Detailed:** `automate_igv_tracks.py` performs:
- Recursive directory scanning of all projects
- Auto-detection of file types (ATAC-seq .bed/.bw, RNA-seq .csv)
- Conversion only of NEW CSV files (skips if BED already exists)
- Generation of both CSV metadata AND JSON IGV configuration
- Update to central trackRegistry.json
- Optional dry-run mode for preview
**Source:** [automate_igv_tracks.py](https://github.com/hbc/app-igv-skinpo1/blob/main/scripts/automate_igv_tracks.py)

### 4. **Cross-Species Translation**
**Original:** "Translates to human coordinates"
**Detailed:** Pipeline supports:
- Auto-detection of species (checks for MGI symbols or Ensembl IDs)
- Mouse → human ortholog mapping (requires ortholog map file)
- Coordinate translation to hg38 (requires human annotation file)
- Falls back to synthetic coordinates if mapping files unavailable
**Note:** Current implementation requires optional mapping files; bio API integration is planned
**Source:** [coordinate_conversion.md](https://github.com/hbc/app-igv-skinpo1/blob/main/scripts/coordinate_conversion.md)

### 5. **Authentication Method**
**Original:** "Lambda functions ask for password"
**Corrected:** Lambda@Edge with Basic HTTP Authentication
**Details:**
- Uses CloudFront Lambda@Edge (not separate Lambda)
- Enforces authentication at edge locations globally
- Credentials configured via environment variables in Lambda function package
- Password is shared with team (not per-user system)
**Source:** [AWS_DEPLOYMENT.md Phase 2](https://github.com/hbc/app-igv-skinpo1/blob/main/docs/AWS_DEPLOYMENT.md)

### 6. **Deployment Architecture**
**Original:** "S3 + Lambda"
**Corrected:** S3 + CloudFront + Lambda@Edge
**Details:**
- S3: Stores static files and genomic data
- CloudFront: CDN distribution for fast global access
- Lambda@Edge: Enforces authentication at edge (faster than origin-based auth)
- Origin Access Control (OAC): Prevents direct S3 access, forces CloudFront
**Source:** [AWS_DEPLOYMENT.md](https://github.com/hbc/app-igv-skinpo1/blob/main/docs/AWS_DEPLOYMENT.md)

### 7. **GitHub Actions Features**
**Original:** "GitHub Action that runs on schedule"
**Detailed:**
- Uses OIDC (OpenID Connect) for AWS authentication—no long-lived credentials
- S3fs-fuse mounts S3 bucket as local filesystem
- Handles MIME type correction for BigWig files automatically
- CloudFront invalidation targeted to specific paths (not always `/*`)
**Source:** [GITHUB_ACTIONS.md](https://github.com/hbc/app-igv-skinpo1/blob/main/docs/GITHUB_ACTIONS.md)

### 8. **Data Format Support**
**Original:** "BED files, bigWig files, bedGraph files"
**Detailed:** IGV supports:
- BED files (ATAC-seq peaks, gene annotations)
- BigWig files (.bw, .bigwig - signal tracks)
- narrowPeak and broadPeak files (ATAC-seq)
- DESeq2 CSV → converted to BED
**Source:** [ADDING_DATASETS.md](https://github.com/hbc/app-igv-skinpo1/blob/main/docs/ADDING_DATASETS.md)

### 9. **User Interface**
**Original:** "Track menu with three projects"
**Detailed:**
- IGV shows three track menus (one per project)
- Clicking a project shows a searchable TABLE of experiments (not just a list)
- Users can search, sort, and filter experiments within projects
- Optional: click experiment to load into browser
**Source:** [Repository structure and ADDING_DATASETS.md](https://github.com/hbc/app-igv-skinpo1/blob/main/README.md)

### 10. **Technology Stack Clarification**
**Added:** Specific tools used
- Frontend: IGV-Web application
- Backend automation: Python (Pixi for dependency management)
- Orchestration: GitHub Actions (YAML workflows)
- Infrastructure: AWS S3, CloudFront, Lambda@Edge
- No custom backend code needed
**Source:** [README.md setup instructions](https://github.com/hbc/app-igv-skinpo1/blob/main/README.md)

## Verification Checklist

✅ Blog post updated with accurate color coding
✅ Video script updated with correct color meanings
✅ Architecture section clarified (S3 + CloudFront + Lambda@Edge)
✅ GitHub Actions details corrected (OIDC authentication)
✅ Data organization specifics added (three named projects)
✅ Automation script capabilities detailed
✅ Cross-species translation caveats noted (requires optional mapping files)
✅ Metadata updated with visual production notes

## Notes for Future Content Updates

- Cross-species translation currently requires optional mapping files; repository README notes that Ensembl API integration is planned
- Current production URL: https://d3vmnhp176lfr2.cloudfront.net/ (password protected via Lambda@Edge)
- The approach emphasizes composition of existing tools rather than custom development
- Pixi is used for dependency management (not standard pip) to ensure reproducibility
