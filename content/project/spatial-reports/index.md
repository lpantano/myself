---
title: Spatial Transcriptomics Analysis Reports
summary: Template repository for spatial single-cell transcriptomics data analysis workflows
tags:
- Bioinformatics
- Spatial Transcriptomics
- Visualizations
date: "2026-01-13T00:00:00Z"

# Optional external URL for project (replaces project detail page).
# external_link: ""

image:
  caption: Spatial Reports
  focal_point: Smart

links:
# - icon: twitter
#   icon_pack: fab
#   name: Follow
#   url: https://twitter.com/georgecushen
url_code: "https://github.com/bcbio/spatial-reports"
url_pdf: ""
url_slides: ""
url_app: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
# slides: example
---

A template repository providing analysis workflows for spatial single-cell transcriptomics data across multiple experimental platforms and analytical packages. This project offers researchers standardized pipelines for quality control, clustering, and cell-type annotation.

[**View on GitHub →**](https://github.com/bcbio/spatial-reports)

## Key Features

- **Multi-Platform Support**: Templates for COSMX and Visium[HD] spatial transcriptomics platforms
- **Quality Control Pipelines**: Comprehensive QC assessment workflows for data validation
- **Clustering Workflows**: Spatial clustering using Banksy and other established tools
- **Cell-Type Annotation**: Integration with spacexr for cell-type identification and differential expression
- **Reproducible Environment**: RStudio Projects with renv package management for dependency control

## Technical Stack

Built entirely in R with integration of leading bioinformatics tools:
- Seurat for Visium object handling
- Banksy for spatial clustering analysis
- spacexr for cell-type identification
- Quarto and R Markdown for report generation

## What It Provides

The repository includes:
- Ready-to-use analysis templates
- Downloadable test data for learning and validation
- Dependency installation scripts
- Quick-start documentation for RStudio users
- Standardized workflows across different spatial platforms

## Development Status

Projects are labeled with revision tiers:
- **Stable**: Fully tested and production-ready
- **Alpha**: Functional but requires additional testing
- **Draft**: Under active development, may need manual parameter tuning

## Why This Matters

Spatial transcriptomics generates complex data requiring specialized analysis approaches. This project:
- Reduces setup time for new spatial transcriptomics projects
- Provides validated workflows following best practices
- Enables reproducible research through standardized templates
- Lowers the barrier to entry for spatial data analysis
- Maintains consistency across different experimental platforms

For more information or to contribute, visit the [GitHub repository](https://github.com/bcbio/spatial-reports).
