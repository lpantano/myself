---
title: Spatial Transcriptomics Analysis Reports
summary: Template repository for spatial single-cell transcriptomics data analysis workflows
tags:
  - Bioinformatics
  - Spatial Transcriptomics
  - Visualization
  - R
  - Seurat
categories:
  - Bioinformatics
date: "2025-01-13"
featured: true
url_code: "https://github.com/bcbio/spatial-reports"
links:
  - name: Code
    url: https://github.com/bcbio/spatial-reports
---

## Overview

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

## Development Status

Projects are labeled with revision tiers:
- **Stable**: Fully tested and production-ready
- **Alpha**: Functional but requires additional testing
- **Draft**: Under active development, may need manual parameter tuning

## Why This Matters

Spatial transcriptomics generates complex data requiring specialized analysis approaches. This project reduces setup time for new spatial transcriptomics projects, provides validated workflows following best practices, enables reproducible research through standardized templates, and lowers the barrier to entry for spatial data analysis.

For more information or to contribute, visit the [GitHub repository](https://github.com/bcbio/spatial-reports).
